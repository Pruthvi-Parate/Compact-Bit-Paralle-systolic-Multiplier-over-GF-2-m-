//testbench to test top module
module systolic_tb();

reg clk;
reg rst;
reg start;
reg [M-1:0]a;
reg [M-1:0]b;
reg [M:0]f;
wire [M-1:0]c;
wire over;



//clock generations
initial begin
    clk=1;
    start<=1'b0;
end

always #5 clk=~clk;


initial begin
    $monitor($time,"a=%b b=%b f=%f start=%b f=%b\n",a,b,f,start,f);
    rst<=1'b1;
    #10 rst<=1'b0;
    a<=1010101;
    b<=1101010;
    f<=11001100;
    start<=1'b1;
    #100
    $finish;

end

endmodule