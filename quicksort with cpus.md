1.想要成功运行带cache的cpu,首先由于指令数据读取机制在这个lab与前两个lab的不同，运行数据和指令都是提前通过python生成内存指令内容并手动输入：

 

因此也需要对cpu的IDSegReg,Hazard，以及主要是封装cache模块的MWSegReg进行修改适配。



![image-20230618204352274](C:\Users\许珂钒\AppData\Roaming\Typora\typora-user-images\image-20230618204352274.png)

MWsegreg不仅需要修改内存模块的实现，同时通过cache的输出更新内存的hit/miss值



相对的，另外两个模块需要的修改更少，Hazard只需要增加一条对cachemiss的条件，保证正在读取主存时