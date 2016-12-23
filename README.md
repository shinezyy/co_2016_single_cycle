### Installation of MIPS toolchain

First, Ubuntu 16.04 is expected (Or ubuntu 14.04). In my experience, for only LTS
version mirror provide tool chain for other architectures.

``` shell
sudo apt get update
sudo apt-cache search gcc-5-mips
```

Then you can get package list like the following:
```
gcc-5-mips-linux-gnu - GNU C compiler
gcc-5-mips-linux-gnu-base - GCC, the GNU Compiler Collection (base package)
gcc-5-mips64-linux-gnuabi64 - GNU C compiler
gcc-5-mips64-linux-gnuabi64-base - GCC, the GNU Compiler Collection (base package)
gcc-5-mips64el-linux-gnuabi64 - GNU C compiler
gcc-5-mips64el-linux-gnuabi64-base - GCC, the GNU Compiler Collection (base package)
gcc-5-mipsel-linux-gnu - GNU C compiler
gcc-5-mipsel-linux-gnu-base - GCC, the GNU Compiler Collection (base package)
```

The MIPS ISA we implemented is, of course, 32 bits, so mips64 should be ignores.
Then the difference between *mips* and *mipsel* is that the latter one support
little-endian only while the former one might support only big-endian or both.
Your should install it according to the endian of your CPU.

### Clone memory generation tool

``` shell
https://github.com/jackyangNJ/testbench4mips.git
```

This is a tool designed by Yang Jie, the TA of CO-2015, which convert C and
assembly code into memory initiating files. Its usage is decribed in README.md
of that repo.

Note that

- You need not to download mips-gcc(This repo's README tell you to do
that, but it is not needed anymore), because mirror of ubuntu provides it.
- the CROSS\_COMPILE defined in the Makefile might not be the same as your
tool-chain's prefix. You need to soft link your tool-chain to satisfy the
Makefile, or modify this variable in Makefile to satisfy your tool-chain.

How to soft link?

``` shell
cd /usr/bin
ls arm*

arm2hpdl                     arm-linux-gnueabi-gcc-4.7         arm-linux-gnueabi-ld.gold
arm-linux-gnueabi-addr2line  arm-linux-gnueabi-gcc-ar-4.7      arm-linux-gnueabi-nm
arm-linux-gnueabi-ar         arm-linux-gnueabi-gcc-nm-4.7      arm-linux-gnueabi-objcopy
arm-linux-gnueabi-as         arm-linux-gnueabi-gcc-ranlib-4.7  arm-linux-gnueabi-objdump
```

If your build system likes them to be *arm-linux-gnu-gcc* instead of
*arm-linux-gnueabi-gcc-4.7*, you can run:

``` shell

sudo ln -s arm-linux-gnueabi-gcc-4.7 arm-linux-gnu-gcc
```

### Use it to build memory init file

This repo ships an example of assembly code for you, in start.S.
Just make, then the following warnings might be encountered:

```
tart.S: Assembler messages:
start.S:34: Warning: macro instruction expanded into multiple instructions in a branch delay slot
start.S:39: Warning: macro instruction expanded into multiple instructions in a branch delay slot
start.S:67: Warning: macro instruction expanded into multiple instructions in a branch delay slot
start.S:90: Warning: macro instruction expanded into multiple instructions in a branch delay slot
```

What's it?

**li** instruction is a macro instruction, it will be translated into 1 or 2
instructions depend on the width of the immediate number.

Open *start.S*, around line 28,  *bne* is followed by *li*. And the immediate
number in *li* is bigger that 2^16-1, so *li* is translated into *lui* and *or*.
Then *lui* is put in the delay slot of *bne*, and gcc found this is not logic:
programmer might want an *li* in delay slot, which cannot be implemented.
So it warns you.

In fact, **this is not what you mean**: we need nothing in a delay slot!
Then, what should we do?

1. Add nops after every jump and branch
2. Compile C codes instead of using the shipped start.S
