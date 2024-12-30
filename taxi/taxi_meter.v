module taxi_meter(
    input clk,          // 时钟信号
    input rst,          // 复位信号，高电平有效
    output reg [19:0] mtr,  // 米数输出
    output reg co       // 每累计满1公里的进位信号
);

// 内部信号定义
reg [19:0] pulse_count; // 脉冲计数器，用于累计脉冲数
reg [10:0] km; // 公里数

// 在时钟上升沿更新计数器
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // 复位信号激活，重置所有计数器
        pulse_count <= 0;
        mtr <= 0;
        co <= 0;
		  km<=0;
    end else begin
        // 每个时钟周期，脉冲计数器加一
        if (pulse_count == 999) begin
            // 每累计到1000个脉冲，公里数加一，进位信号置1
            km <= km + 1; // 千米数加1（因为是以公里为单位，所以加1）
            co <= 1; // 进位信号置1
            pulse_count <= 0; // 脉冲计数器清零
        end else begin
            pulse_count <= pulse_count + 1; // 脉冲计数器加一
				mtr <= km*1000 + pulse_count;
            co <= 0; // 进位信号置0
        end
    end
end

endmodule