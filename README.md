# -hut
要求是起步价 3元，准行 1公里，以后 1元/公里。电机模块的跳线选择GND端，这样通过旋钮电机模块的电位器，即可达到控制电机转速的目的。另外用按键模块的KEY0来作为整个系统的复位按钮，每复位一次，计费器从头开始计费。直流电机用来模拟出租车的车轮子，每转动一圈认为是行走 1米，所以每旋转1000圈，认为车子前进1公里。系统设计是需要检测电机的转动情况，每转一周，计米计数器增加 1。七段码管显示要求为前3个显示里程，后 3个显示费用
