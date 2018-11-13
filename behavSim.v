module stimulus;
	
	reg [7:0] A, B;
	wire [8:0] SUM;
	
	fullAdder #(
		.DATA_WIDTH(8)
	) fullAdder_instance (
		.data1(A),
		.data2(B),
		.result(SUM)
	);
	
	initial begin
		$monitor($time, " A= %b, B= %b --- SUM = %b \n", A, B, SUM);
	end
	
	initial begin
		A = 8'd0; B = 8'd0;
  		#5 A = 8'd3; B = 8'd4; 
  		#5 A = 8'd2; B = 8'd5; 
  		#5 A = 8'd9; B = 8'd9; 
  		#5 A = 8'd10; B = 8'd15; 
		#5 A = 8'd10; B = 8'd5;
	end
	
endmodule