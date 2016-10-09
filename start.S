# slt 0xffffffff 0xcccc
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0xcccc
srl $8, $8, 16
or $28, $7, $8
slt $29, $27, $28
# expected 0x1
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next1
li $31, 1
j trap
next1:
li $26, 1
# slti 0xffffffff 0xcccc
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
slti $29, $27, 0xcccc
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next2
li $31, 2
j trap
next2:
li $26, 2
# and  0x11111 0x8000
lui $7, 0x1
lui $8, 0x1111
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $28, $7, $8
and $29, $27, $28
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next3
li $31, 3
j trap
next3:
li $26, 3
# andi 0x11111 0x8000
lui $7, 0x1
lui $8, 0x1111
srl $8, $8, 16
or $27, $7, $8
andi $29, $27, 0x8000
# expected
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next4
li $31, 4
j trap
next4:
li $26, 4
# or 0x1 0x8000
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $28, $7, $8
or $29, $27, $28
# expected 0x8001
lui $7, 0x0
lui $8, 0x8001
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next5
li $31, 5
j trap
next5:
li $26, 5
# ori 0x1 0x8000
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $27, $7, $8
ori $29, $27, 0x8000
# expected 0x8001
lui $7, 0x0
lui $8, 0x8001
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next6
li $31, 6
j trap
next6:
li $26, 6
# xor 0x8000 0x18000
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x1
lui $8, 0x8000
srl $8, $8, 16
or $28, $7, $8
xor $29, $27, $28
# expected 0x10000
lui $7, 0x1
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next7
li $31, 7
j trap
next7:
li $26, 7
# xori 0x8000 0x8000
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $27, $7, $8
xori $29, $27, 0x8000
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next8
li $31, 8
j trap
next8:
li $26, 8
# nor 0x8000 0x1
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $28, $7, $8
nor $29, $27, $28
# expected 0xffff7ffe
lui $7, 0xffff
lui $8, 0x7ffe
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next9
li $31, 9
j trap
next9:
li $26, 9
# ori 0xccc 0xffff
lui $7, 0x0
lui $8, 0xccc
srl $8, $8, 16
or $27, $7, $8
ori $29, $27, 0xffff
# expected 0xffff
lui $7, 0x0
lui $8, 0xffff
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next10
li $31, 10
j trap
next10:
li $26, 10
# add 0xccc 0xeee
lui $7, 0x0
lui $8, 0xccc
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0xeee
srl $8, $8, 16
or $28, $7, $8
add $29, $27, $28
# expected 0x1bba
lui $7, 0x0
lui $8, 0x1bba
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next11
li $31, 11
j trap
next11:
li $26, 11
# sub 0xccc 0xeee
lui $7, 0x0
lui $8, 0xccc
srl $8, $8, 16
or $27, $7, $8
sub $29, $27, 0xeee
# expected 0xfffffdde
lui $7, 0xffff
lui $8, 0xfdde
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next12
li $31, 12
j trap
next12:
li $26, 12
# and 0xccc 0xbbb
lui $7, 0x0
lui $8, 0xccc
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0xbbb
srl $8, $8, 16
or $28, $7, $8
and $29, $27, $28
# expected 0x888
lui $7, 0x0
lui $8, 0x888
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next13
li $31, 13
j trap
next13:
li $26, 13
# or 0xcc 0xee
lui $7, 0x0
lui $8, 0xcc
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0xee
srl $8, $8, 16
or $28, $7, $8
or $29, $27, $28
# expected 0xee
lui $7, 0x0
lui $8, 0xee
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next14
li $31, 14
j trap
next14:
li $26, 14
# nor 0xcce 0xeec
lui $7, 0x0
lui $8, 0xcce
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0xeec
srl $8, $8, 16
or $28, $7, $8
nor $29, $27, $28
# expected 0xfffff111
lui $7, 0xffff
lui $8, 0xf111
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next15
li $31, 15
j trap
next15:
li $26, 15
# xor 0xcec 0xece
lui $7, 0x0
lui $8, 0xcec
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0xece
srl $8, $8, 16
or $28, $7, $8
xor $29, $27, $28
# expected 0x222
lui $7, 0x0
lui $8, 0x222
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next16
li $31, 16
j trap
next16:
li $26, 16
# add 0x7fffffff 0x1
lui $7, 0x7fff
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $28, $7, $8
add $29, $27, $28
# no expectation check
next17:
li $26, 17
# addu 0x7fffffff 0x1
lui $7, 0x7fff
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $28, $7, $8
addu $29, $27, $28
# expected 0x80000000
lui $7, 0x8000
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next18
li $31, 18
j trap
next18:
li $26, 18
# addi 0x7 0x8000
lui $7, 0x0
lui $8, 0x7
srl $8, $8, 16
or $27, $7, $8
addi $29, $27, 0x8000
# expected 0xffff8007
lui $7, 0xffff
lui $8, 0x8007
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next19
li $31, 19
j trap
next19:
li $26, 19
# slt 0x2 0x1
lui $7, 0x0
lui $8, 0x2
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $28, $7, $8
slt $29, $27, $28
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next20
li $31, 20
j trap
next20:
li $26, 20
# slt 0xffff 0xcccc
lui $7, 0x0
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0xcccc
srl $8, $8, 16
or $28, $7, $8
slt $29, $27, $28
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next21
li $31, 21
j trap
next21:
li $26, 21
# sll 0x1, 0xf
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $27, $7, $8
sll $29, $27, 0xf
# expected 0x8000
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next22
li $31, 22
j trap
next22:
li $26, 22
# srl 0x8000, 0xf
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $27, $7, $8
srl $29, $27, 0xf
# expected 0x1
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next23
li $31, 23
j trap
next23:
li $26, 23
# sra 0x80000000, 0x1f
lui $7, 0x8000
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
sra $29, $27, 0x1f
# expected 0xffffffff
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next24
li $31, 24
j trap
next24:
li $26, 24
# sltiu 0x8, 0xffff
lui $7, 0x0
lui $8, 0x8
srl $8, $8, 16
or $27, $7, $8
sltiu $29, $27, 0xffff
# expected 0x1
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next25
li $31, 25
j trap
next25:
li $26, 25
# srav 0x8000, 0x4
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x4
srl $8, $8, 16
or $28, $7, $8
srav $29, $27, $28
# expected 0x800
lui $7, 0x0
lui $8, 0x800
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next26
li $31, 26
j trap
next26:
li $26, 26
# sltiu 0x8, 0xcfff
lui $7, 0x0
lui $8, 0x8
srl $8, $8, 16
or $27, $7, $8
sltiu $29, $27, 0xcfff
# expected 0x1
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next27
li $31, 27
j trap
next27:
li $26, 27
# bne 0xcccc, 0xccce
lui $7, 0x0
lui $8, 0xcccc
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0xccce
srl $8, $8, 16
or $28, $7, $8
bne $27, $28, next28
li $31, 28
j trap
# no expectation check
next28:
li $26, 28
# bgez 0xffff
lui $7, 0x0
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
bgez $27, next29
li $31, 29
j trap
# no expectation check
next29:
li $26, 29
# blez 0xffffffff
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
blez $27, next30
li $31, 30
j trap
# no expectation check
next30:
li $26, 30
# clz 0xffff
lui $7, 0x0
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
clz $29, $27
# expected 0x10
lui $7, 0x0
lui $8, 0x10
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next31
li $31, 31
j trap
next31:
li $26, 31
# clz 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
clz $29, $27
# expected 0x20
lui $7, 0x0
lui $8, 0x20
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next32
li $31, 32
j trap
next32:
li $26, 32
# clz 0xffff0000
lui $7, 0xffff
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
clz $29, $27
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next33
li $31, 33
j trap
next33:
li $26, 33
# clz 0x10000000
lui $7, 0x1000
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
clz $29, $27
# expected 0x3
lui $7, 0x0
lui $8, 0x3
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next34
li $31, 34
j trap
next34:
li $26, 34
# clz 0x80000000
lui $7, 0x8000
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
clz $29, $27
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next35
li $31, 35
j trap
next35:
li $26, 35
# clz 0x70000000
lui $7, 0x7000
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
clz $29, $27
# expected 0x1
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next36
li $31, 36
j trap
next36:
li $26, 36
# clo 0x32038904
lui $7, 0x3203
lui $8, 0x8904
srl $8, $8, 16
or $27, $7, $8
clo $29, $27
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next37
li $31, 37
j trap
next37:
li $26, 37
# clo 0xf9430950
lui $7, 0xf943
lui $8, 0x950
srl $8, $8, 16
or $27, $7, $8
clo $29, $27
# expected 0x5
lui $7, 0x0
lui $8, 0x5
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next38
li $31, 38
j trap
next38:
li $26, 38
# clo 0x00001000
lui $7, 0x0
lui $8, 0x1000
srl $8, $8, 16
or $27, $7, $8
clo $29, $27
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next39
li $31, 39
j trap
next39:
li $26, 39
# clo 0xfff00000
lui $7, 0xfff0
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
clo $29, $27
# expected 0xc
lui $7, 0x0
lui $8, 0xc
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next40
li $31, 40
j trap
next40:
li $26, 40
# slti 0x8000, 0xcfff
lui $7, 0x0
lui $8, 0x8000
srl $8, $8, 16
or $27, $7, $8
slti $29, $27, 0xcfff
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next41
li $31, 41
j trap
next41:
li $26, 41
# srav 0xf0000000, 0x10
lui $7, 0xf000
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x10
srl $8, $8, 16
or $28, $7, $8
srav $29, $27, $28
# expected 0xfffff000
lui $7, 0xffff
lui $8, 0xf000
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next42
li $31, 42
j trap
next42:
li $26, 42
# sllv 0xf0000111, 0x10
lui $7, 0xf000
lui $8, 0x111
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x10
srl $8, $8, 16
or $28, $7, $8
sllv $29, $27, $28
# expected 0x1110000
lui $7, 0x111
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next43
li $31, 43
j trap
next43:
li $26, 43
# srlv 0xf0000000, 0x10
lui $7, 0xf000
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x0
lui $8, 0x10
srl $8, $8, 16
or $28, $7, $8
srlv $29, $27, $28
# expected 0xf000
lui $7, 0x0
lui $8, 0xf000
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next44
li $31, 44
j trap
next44:
li $26, 44
# bltz 0xffffffff
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
bltz $27, next45
li $31, 45
j trap
# no expectation check
next45:
li $26, 45
# blez 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
blez $27, next46
li $31, 46
j trap
# no expectation check
next46:
li $26, 46
# bgez 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
bgez $27, next47
li $31, 47
j trap
# no expectation check
next47:
li $26, 47
# slt 0xffffffff, 0x7fffffff
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x7fff
lui $8, 0xffff
srl $8, $8, 16
or $28, $7, $8
slt $29, $27, $28
# expected 0x1
lui $7, 0x0
lui $8, 0x1
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next48
li $31, 48
j trap
next48:
li $26, 48
# sltu 0xffffffff, 0x7fffffff
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x7fff
lui $8, 0xffff
srl $8, $8, 16
or $28, $7, $8
sltu $29, $27, $28
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next49
li $31, 49
j trap
next49:
li $26, 49
# or 0xcccccccc, 0x33333333
lui $7, 0xcccc
lui $8, 0xcccc
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x3333
lui $8, 0x3333
srl $8, $8, 16
or $28, $7, $8
or $29, $27, $28
# expected 0xffffffff
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next50
li $31, 50
j trap
next50:
li $26, 50
# xor 0xcccccccc, 0x33333333
lui $7, 0xcccc
lui $8, 0xcccc
srl $8, $8, 16
or $27, $7, $8
lui $7, 0x3333
lui $8, 0x3333
srl $8, $8, 16
or $28, $7, $8
xor $29, $27, $28
# expected 0xffffffff
lui $7, 0xffff
lui $8, 0xffff
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next51
li $31, 51
j trap
next51:
li $26, 51
# xori 0xcccccccc, 0x3333
lui $7, 0xcccc
lui $8, 0xcccc
srl $8, $8, 16
or $27, $7, $8
xori $29, $27, 0x3333
# expected 0xccccffff
lui $7, 0xcccc
lui $8, 0xffff
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next52
li $31, 52
j trap
next52:
li $26, 52
# ori 0xcccccccc, 0x3333
lui $7, 0xcccc
lui $8, 0xcccc
srl $8, $8, 16
or $27, $7, $8
ori $29, $27, 0x3333
# expected 0xccccffff
lui $7, 0xcccc
lui $8, 0xffff
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next53
li $31, 53
j trap
next53:
li $26, 53
# nor 0x55555555, 0xaaaaaaaa
lui $7, 0x5555
lui $8, 0x5555
srl $8, $8, 16
or $27, $7, $8
lui $7, 0xaaaa
lui $8, 0xaaaa
srl $8, $8, 16
or $28, $7, $8
nor $29, $27, $28
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next54
li $31, 54
j trap
next54:
li $26, 54
# and 0x5a5a5a5a, 0xa5a5a5a5
lui $7, 0x5a5a
lui $8, 0x5a5a
srl $8, $8, 16
or $27, $7, $8
lui $7, 0xa5a5
lui $8, 0xa5a5
srl $8, $8, 16
or $28, $7, $8
and $29, $27, $28
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next55
li $31, 55
j trap
next55:
li $26, 55
# andi 0x5a5a5a5a, 0xa5a5
lui $7, 0x5a5a
lui $8, 0x5a5a
srl $8, $8, 16
or $27, $7, $8
andi $29, $27, 0xa5a5
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next56
li $31, 56
j trap
next56:
li $26, 56
# bgtz 0xffff
lui $7, 0x0
lui $8, 0xffff
srl $8, $8, 16
or $27, $7, $8
bgtz $27, next57
li $31, 57
j trap
# no expectation check
next57:
li $26, 57
# sub 0x1111, 0x1111
lui $7, 0x0
lui $8, 0x1111
srl $8, $8, 16
or $27, $7, $8
sub $29, $27, 0x1111
# expected 0x0
lui $7, 0x0
lui $8, 0x0
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next58
li $31, 58
j trap
next58:
li $26, 58
# subu 0x80000000, 0x1
lui $7, 0x8000
lui $8, 0x0
srl $8, $8, 16
or $27, $7, $8
subu $29, $27, 0x1
# expected 0x7fffffff
lui $7, 0x7fff
lui $8, 0xffff
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next59
li $31, 59
j trap
next59:
li $26, 59
# xori 0xcccccc, 0xeeee
lui $7, 0xcc
lui $8, 0xcccc
srl $8, $8, 16
or $27, $7, $8
xori $29, $27, 0xeeee
# expected 0xcc2222
lui $7, 0xcc
lui $8, 0x2222
srl $8, $8, 16
or $30, $7, $8
beq $30, $29, next60
li $31, 60
j trap
next60:
li $26, 60
# infinite loop
trap:
b trap
