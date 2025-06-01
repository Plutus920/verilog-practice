// Top-level testbench module
module dff_tb();
    
    // Declare signals for DUT connection 
    reg clk; 
    reg reset;
    reg d;
    wire q; 

    // Instantiate DUT module
    dff DFF(.clk(clk), .reset(reset), .d(d), .q(q));

    // Clock Generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Initialize testbench variables
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, dff_tb);
    
        d = 0; 
        reset = 1;

        @(posedge clk);
        reset = 0;

        @(posedge clk);
        d = 1;

        @(posedge clk);
        d=0;

        @(posedge clk);
        $finish;
    end
endmodule