module dff (input clk, 
            input reset, 
            input d, 
            output q);

    reg q; 

    always @(posedge clk or posedge reset)
    begin 
        if (reset) begin
            //asynchronous reset when reset is high
            q<=1'b0; 
        end else begin 
            q<=d; 
        end

    end 
endmodule