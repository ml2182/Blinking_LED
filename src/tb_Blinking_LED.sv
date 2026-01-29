`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 01:07:09
// Design Name: 
// Module Name: tb_Blinking_LED
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_Blinking_LED;
reg clk;
reg reset;
wire led;
Blinking_LED uut ( .clk (clk),
              .reset (reset),
              .led (led));
               
initial begin
    clk = 0;

end
always begin
    #5 clk = ~clk; // 100MHz clock
end
always @(led) begin
    $display("LED changed at time %0t, new value = %b", $time, led);
end
initial begin
    reset = 0;
    #500_000_000;
    if (led==1) begin
        $display ("Correctly Turns On");
    end else begin
        $display ("Incorrectly Turns On, Time = %0t, Led = %b",$time, led);    
    end
    #2_000_000_000 reset = 1; // reset when the clock signal is at 0 
    if (led == 0) begin 
        $display ("Correctly Resets, Time = %0t, Led = %b",$time, led);
    end else begin
        $display ("Incorrectly Resets, Time = %0t, Led = %b",$time, led);
    end    
    #5 reset = 0;
end
endmodule
