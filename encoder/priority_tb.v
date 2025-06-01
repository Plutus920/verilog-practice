module priority_tb();

reg [3:0] a; 
reg [3:0] b; 
reg [3:0] c; 
reg [3:0] d;
reg [1:0] sel;

integer i;

wire [3:0] out; 
 
encoder enc(.a(a),
            .b(b),
            .c(c),
            .d(d),
            .sel(sel),
            .out(out));
    

initial begin 

    $dumpfile("waveform.vcd");
    $dumpvars(0, priority_tb); 

    sel <=0; 
    a <= $random; 
    b <= $random;
    c <= $random;
    d <= $random;

    for (i=1; i<5; i=i+1) begin
        #5 sel <= i;
    end

    #5 $finish;
end
endmodule