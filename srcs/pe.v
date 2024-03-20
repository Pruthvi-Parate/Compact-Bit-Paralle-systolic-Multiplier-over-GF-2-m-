module ProcessingElementfirst(
    input clk,reset,
    input a_m_1,
    input a_m_2,
    input f_m_1,
    input b_in,
    input sel,
    input a_i_m_2, 
    output reg a_i_m_1, c_m_1
    );
wire mux1_out, mux2_out, mux3_out;
wire and1,xor1,and2,xor2;
reg latch2;
assign mux1_out = sel ? a_m_1 : a_i_m_1;
assign mux2_out = sel ? a_m_2 : a_i_m_2;
assign mux3_out = sel ? a_m_1 : a_i_m_1 ; 

assign and1 = mux1_out & f_m_1;
assign xor1 = and1 ^ mux1_out;
assign and2 = b_in & mux3_out;
assign xor2 = and2 ^ latch2;

always @(posedge clk or posedge reset) begin
     if (reset) begin
        // Reset the internal state
        a_i_m_1 <= 1'b0;
        c_m_1 <= 1'b0;
    end else begin
        
        a_i_m_1 <= xor1; 
        latch2 <= xor2;
        c_m_1 <= xor2;
    end
end

endmodule
