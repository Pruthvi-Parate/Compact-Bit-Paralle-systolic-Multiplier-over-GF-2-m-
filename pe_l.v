`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 09:34:41 PM
// Design Name: 
// Module Name: systolic
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







module ProcessingElementlast(
    input clk,reset,
    input a_j,
    input a_j_1,
    input a_m_1,
    input a_i_m_1,
    input f_j,
    input b_in,
    input sel,
    input a_i_j_1, 
    output reg a_i_j, c_j
    );
wire mux1_out, mux2_out, mux3_out;
wire and1,xor1,and2,xor2;
reg latch2;
assign mux1_out = sel ? a_m_1 : a_i_m_1;
assign mux2_out = sel ? a_j_1 : a_i_j_1;
assign mux3_out = sel ? a_j : a_i_m_1 ; 

assign and1 = mux1_out & f_j;
assign xor1 = and1 ^ mux2_out;
assign and2 = b_in & mux3_out;
assign xor2 = and2 ^ latch2;

always @(posedge clk or posedge reset) begin
     if (reset) begin
        // Reset the internal state
        a_i_j <= 1'b0;
        c_j <= 1'b0;
    end else begin
        
        a_i_j<= xor1; 
        latch2 <= xor2;
        c_j <= xor2;
    end
end

endmodule
