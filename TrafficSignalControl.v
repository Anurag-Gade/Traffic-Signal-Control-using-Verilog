`timescale 1ns / 1ps
module TrafficSignalControl(
	input clk,
	input rst,
	output reg[2:0] light_RS,
	output reg[2:0] light_RD,
	output reg[2:0] light_RT,
	output reg[2:0] light_LD
    );
	 
	 reg[2:0] present_state;
	 reg[3:0] count;
	 
	 // State parameters
	 parameter s1 = 0, s2 = 1, s3 = 2, s4 = 3, s5 = 4, s6 = 5;
	 
	 // Timing (inputs)
	 parameter t1 = 8, t2 = 2, t3 = 5, t4 = 4;
	 
	 always@(posedge clk or posedge rst) begin
		
		if(rst == 1) begin
			
			present_state <= s1;
			count <= 0;
		
		end
		
		else 
			
			case(present_state)
			
				s1: if(count<t1) begin
					
					present_state <= s1;
					count <= count + 1;
				
					end
				
					else	begin
						
						present_state <= s2;
						count <= 0;
					
					end
				
				s2: if(count<t2) begin
					
					present_state <= s2;
					count <= count + 1;
				
					end
				
					else	begin
						
						present_state <= s3;
						count <= 0;
					
					end
				
				s3: if(count<t3) begin
					
					present_state <= s3;
					count <= count + 1;
				
					end
				
					else	begin
						
						present_state <= s4;
						count <= 0;
					
					end
				
				s4: if(count<t2) begin
					
					present_state <= s4;
					count <= count + 1;
				
					end
				
					else	begin
						
						present_state <= s5;
						count <= 0;
					
					end
				
				s5: if(count<t4) begin
					
					present_state <= s5;
					count <= count + 1;
				
					end
				
					else	begin
						
						present_state <= s6;
						count <= 0;
					
					end
				
				s6: if(count<t2) begin
					
					present_state <= s6;
					count <= count + 1;
				
					end
				
					else	begin
						
						present_state <= s1;
						count <= 0;
					
					end
				
				default:
					
					present_state <= s1;
				
				endcase
		
	 end
	 
	 always@(present_state) begin
		
		case (present_state) 
			
			s1: begin
				light_RS = 3'b001;
				light_RD = 3'b100;
				light_RT = 3'b100;
				light_LD = 3'b001;
				end
			
			s2: begin
				light_RS = 3'b001;
				light_RD = 3'b100;
				light_RT = 3'b100;
				light_LD = 3'b010;
				end
			
			s3: begin
				light_RS = 3'b001;
				light_RD = 3'b001;
				light_RT = 3'b100;
				light_LD = 3'b100;
				end
			
			s4: begin
				light_RS = 3'b010;
				light_RD = 3'b010;
				light_RT = 3'b100;
				light_LD = 3'b100;
				end
			
			s5: begin 
				light_RS = 3'b100;
				light_RD = 3'b100;
				light_RT = 3'b001;
				light_LD = 3'b100;
				end
			
			s6: begin
				light_RS = 3'b100;
				light_RD = 3'b100;
				light_RT = 3'b010;
				light_LD = 3'b100;
				end
			
			default: begin
				light_RS = 3'b000;
				light_RD = 3'b000;
				light_RT = 3'b000;
				light_LD = 3'b000;
				end
			
			endcase
			
		end

endmodule
