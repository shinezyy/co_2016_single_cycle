### cache顶层模块接口的意义

```

input:

From CPU:

clk: cache使用的时钟
rst: cache使用的复位信号: 1表示复位
ic_read_in: 表示CPU向cache发起了取指令请求，1有效
dc_read_in: 表示CPU向cache发起了读数据请求，1有效
dc_write_in: 表示CPU下cache发起了写数据请求，1有效
dc_byte_w_en_in: 表示写入数据时的字节写使能，仅当dc_write_in有效时有意义
ic_addr: 表示CPU取指令的时候的地址，仅当ic_read_in有效的时候有意义
dc_addr: 表示CPU读写数据的时候的地址，仅当dc_read_in或者dc_write_in有效的时候有意义
data_from_reg: 表示CPU向cache写入的数据，宽度为4bytes

From DDR:

ram_ready: 表示RAM当前是空闲的，或者表示DDR完成了来自cache的数据读写请求
block_from_ram: 来自DDR的数据块，当加载数据，而且ram_ready有效的时候有意义



output:

To CPU:

mem_stall: 表示现在还有来自CPU的请求还没有完成; 如果mem_stall无效，则是表示
CPU发送到cache的请求被满足了

dc_data_out: 表示返回到CPU的数据，仅当CPU读取数据且mem_stall无效的时候有意义
ic_data_out: 表示返回到CPU的指令，仅当CPU取指令且mem_Stall无效的时候有意义

To RAM:

ram_en_out: 发送到DDR的信号，表示需要读写DDR了;
ram_write_out: 发送到DDR的信好，1表示需要写入DDR，0表示读DDR，仅当ram_en_out有效时
有意义

ram_addr_out: 发送到DDR的信号，表示地址，仅当ram_en_out有效时有意义
dc_data_wb: 发送到DDR的信号，表示写回DDR的数据的内容，仅当ram_en_out有效，
且ram_write_out有效时有意义


```
