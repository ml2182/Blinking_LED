`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2025 22:58:28
// Design Name: 
// Module Name: Blinking LED
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


module Blinking_LED(//blink at 1Hz with a clock cycle of 100MHz
    input logic clk,
    input logic reset, 
    output logic led = 0
    );
logic [25:0] counter = 0; // 33554431*2 combinations having to account for Basys 3 having a clock of 100MHz
always_ff @ (posedge clk or posedge reset) begin
    if ((reset)) begin
        counter <= 0;
        led <= 0;
    end else begin
        counter <= counter + 1;
        if (counter == 50000000 - 1) begin // had to include -1 because it toggled the LED 30ns after 0.5 s due to <= scheduling
            counter <=0;
            led <= ~led;
        end
    end
end
         
        
        

endmodule
   
