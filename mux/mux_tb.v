module mux_tb();

    //Declare internal reg variables to drive design inputs

    reg [3:0] a; 
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg [1:0] sel;
    integer i;

    wire [3:0] out; 

    mux4to1 mux(.a (a), .b (b), .c (c), 
                .d (d), .sel (sel), .out (out)); 

    initial begin

        $dumpfile("waveform.vcd");
        $dumpvars(0, mux_tb);

        // 1. At time 0, drive random values to a/b/c/d and sel=0

        sel <= 0; 
        a <= $random; 
        b <= $random; 
        c <= $random; 
        d <= $random; 
        
        // 2. Change the value of sel after every 5ns

        for (i=1; i<4; i=i+1) begin 
            #5 sel <= i;
        end
    
        #5 $finish; 
    end 
endmodule

            

    
