module pay_display(
    input clk,          // 时钟信号
    input rst,          // 复位信号，高电平有效
    input [9:0] in,     // 从出租车计费程序接收的费用
    output reg [3:0] seg0, // 第一个数码管的输出（个位）
    output reg [3:0] seg1, // 第二个数码管的输出（十位）
    output reg [3:0] seg2  // 第三个数码管的输出（百位）
);

// 将费用转换为数码管显示
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // 复位信号激活，重置数码管显示
        seg0 <= 4'b0000; // 0
        seg1 <= 4'b0000; // 0
        seg2 <= 4'b0000; // 0
    end else begin
        // 确定数码管的显示
        seg0 <= in % 10; // 个位
        seg1 <= (in / 10) % 10; // 十位
        seg2 <= in / 100; // 百位
    end
end

endmodule