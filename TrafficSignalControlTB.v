`timescale 1ns / 1ps

module TrafficSignalControlTB;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [2:0] light_RS;
	wire [2:0] light_RD;
	wire [2:0] light_RT;
	wire [2:0] light_LD;

	// Instantiate the Unit Under Test (UUT)
	TrafficSignalControl uut (
		.clk(clk), 
		.rst(rst), 
		.light_RS(light_RS), 
		.light_RD(light_RD), 
		.light_RT(light_RT), 
		.light_LD(light_LD)
	);

	initial begin
		// Initialize Inputs
		clk = 1'b0;
		
		forever #(1000000000/2) clk=~clk;

	end
	
	initial
		begin
		 rst=0;
		 #1000000000;
		 rst=1;
		 #1000000000;
		 rst=0;
		 #(1000000000*200);
		 $finish;
		end

      
endmodule

