module fullAdder #(parameter DATA_WIDTH = 8)(input[DATA_WIDTH-1:0] data1, input[DATA_WIDTH-1:0] data2, output[DATA_WIDTH:0] result);
	wire[7:0] carry_wire;
	wire[7:0] sum_wire;	
	
	genvar k;
	generate 
		for(k = 0; k < DATA_WIDTH; k = k + 1) begin
			if(k == 0)
				adder_1b one_instance (.a(data1[k]), .b(data2[k]), .c_in(1'b0), .sum(sum_wire[k]), .c_out(carry_wire[k]));
			else
				adder_1b one_instance (.a(data1[k]), .b(data2[k]), .c_in(carry_wire[k-1]), .sum(sum_wire[k]), .c_out(carry_wire[k]));
		end
	endgenerate
	
	assign result = {carry_wire[7], sum_wire};
endmodule
