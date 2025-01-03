module mileage_display(
    input clk,          // 时钟信号
    input rst,          // 复位信号，高电平有效
    input [19:0] i,   // 从里程计数器接收的米数
    output reg [3:0] seg0, // 第一个数码管的输出（十位公里数）
    output reg [3:0] seg1, // 第二个数码管的输出（个位公里数，带小数点）
    output reg [3:0] seg2  // 第三个数码管的输出（0.1公里数）
);

// 内部信号定义
reg [19:0] km; // 扩展公里数，用于存储米数转换为公里数的结果

// 将米转换为公里，并更新数码管显示
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // 复位信号激活，重置公里数
        //i <= 0;
        seg0 <= 4'b0000; // 0
        seg1 <= 4'b1000; // 带小数点的0
        seg2 <= 4'b0000; // 0
    end else begin
        // 更新公里数
        km <= i; // 将米数赋值给公里数变量

        // 确定数码管的显示
        seg0 <= km / 10000; // 十位公里数
        seg1 <= (km / 1000) % 10 ; // 个位公里数
        seg2 <= (km / 100) % 10; // 0.1公里数
    end
end

endmodule