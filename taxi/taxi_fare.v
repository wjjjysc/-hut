module taxi_fare(
    input mode,         // 模式切换：白天，夜晚
    input clk,          // 时钟信号
    input rst,          // 复位信号，高电平有效
    output reg [9:0] y  // 费用输出，10位足够表示到999
);

// 在时钟上升沿或复位信号上升沿时触发
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // 复位信号激活，重置费用
        if (mode == 0) begin
            y <= 3; // 白天初始费用为3
        end else begin
            y <= 5; // 夜晚初始费用为5
        end
    end else begin
        // 费用未达到最大值999，根据模式增加费用
        if (y < 999) begin
            if (mode == 0) begin
                y <= y + 1; // 白天每次增加1
            end else begin
                y <= y + 2; // 夜晚每次增加2
            end
        end
        // 如果费用达到999，保持不变
    end
end

endmodule
