module top(Clk, x, shamt, LR, AL, y);
	input Clk;
	input [7:0]x;
	input [2:0]shamt; //移动位数
	input LR; //右/左
	input AL; //逻辑/算数
	output reg [7:0]y;
	
	reg [4:0]operate;
	
	always @(posedge Clk) begin
		operate <= {shamt, LR, AL};
		case (operate)
			5'b00000: y <= x;
			5'b00001: y <= x;
			5'b00010: y <= x;
			5'b00011: y <= x;
			5'b00100: y <= {1'b0, x[7:1]};
			5'b00101: y <= {x[7], x[7:1]};
			5'b00110: y <= {x[6:0], 1'b0};
			5'b00111: y <= {x[7], x[5:0], 1'b0};
			5'b01000: y <= {2'b0, x[7:2]};
			5'b01001: y <= {{2{x[7]}}, x[7:2]};
			5'b01010: y <= {x[5:0], 2'b0};
			5'b01011: y <= {x[7], x[4:0], 2'b0};
			5'b01100: y <= {3'b0, x[7:3]};
			5'b01101: y <= {{3{x[7]}}, x[7:3]};
			5'b01110: y <= {x[4:0], 3'b0};
			5'b01111: y <= {x[7], x[3:0], 3'b0};
			5'b10000: y <= {4'b0, x[7:4]};
			5'b10001: y <= {{4{x[7]}}, x[7:4]}; 
			5'b10010: y <= {x[3:0], 4'b0};
			5'b10011: y <= {x[7], x[2:0], 4'b0};
			5'b10100: y <= {5'b0, x[7:5]};
			5'b10101: y <= {{5{x[7]}}, x[7:5]};
			5'b10110: y <= {x[2:0], 5'b0};
			5'b10111: y <= {x[7], x[1:0], 5'b0};
			5'b11000: y <= {6'b0, x[7:6]};
			5'b11001: y <= {{6{x[7]}}, x[7:6]}; 
			5'b11010: y <= {x[1:0], 6'b0};
			5'b11011: y <= {x[7], x[0:0], 6'b0};
			5'b11100: y <= {7'b0, x[7:7]};
			5'b11101: y <= {{7{x[7]}}, x[7:7]};
			5'b11110: y <= {x[0:0], 7'b0};
			5'b11111: y <= {x[7], 7'b0};
		endcase
	end
endmodule
	
