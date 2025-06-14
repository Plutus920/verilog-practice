//`timescale 1ns / 1ps

module tb_jk();

    reg j;
    reg k; 
    reg clk; 
    reg rst_n;

    wire q;

    //Instantiate JK DUT

    jkff DUT (  .j(j),
                .k(k),
                .clk(clk),
                .rst_n(rst_n),
                .q(q));

    // Clock Generation 

    initial clk = 0; 
    always #5 clk = ~clk; 

    //Drive Inputs

    initial begin 
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_jk);

        // Initialize inputs
        j = 0; k = 0; 
        rst_n = 0;  // Assert reset
        #7;
        rst_n = 1;  // Deassert reset
        #10; 

        // {j,k} = 00 - hold current value
        j =0; k = 0; 
        #10;
        $display("j=%b, k=%b, ==> q = %b", j, k, q);

        // {j,k} = 10 - set the flop
        j = 1; k = 0; 
        #10; 
        $display("j=%b, k=%b, ==> q = %b", j, k, q);

        // {j,k} = 01 - reset the flop
        j = 0; k = 1; 
        #10;
        $display("j=%b, k=%b, ==> q = %b", j, k, q);

        // {j,k} = 11 - toggle 
        j = 1; k = 1; 
        #10; 
        $display("j=%b, k=%b, ==>  q = %b", j, k, q);

        // reset again using asynchronous input
        rst_n = 0; 
        #5; 
        rst_n = 1; 
        $display("j=%b, k=%b, ==>  q = %b", j, k, q);

        #10; 
        $finish; 
    end 
endmodule