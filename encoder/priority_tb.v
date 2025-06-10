module priority_tb();
 
reg [7:0] in; 
wire [2:0] out;

integer i;

encoder p_encoder(  .in(in),
                    .out(out));
    
initial begin 

    $dumpfile("waveform.vcd");
    $dumpvars(0, priority_tb); 

    for(i=0; i<8; i=i+1) begin
        in = 8'b1 << i;
        #5;
        
        $display("in = %b => out = %b", in, out);
        
    end

    //test all low bits
    in = 8'b00000000; #5;
        $display ("in = %b => out = %b (should be 000)", in, out);
    
    //test multiple high bits
    in = 8'b01010101; #5;
        $display("in = %b, out = %b, (should be 110)", in, out);

    //random 
    repeat(5) begin 
        in = $random; 
        #5; 
        $display("in = %b ==> out = %b", in, out);
    end

    #5 $finish;
end
endmodule