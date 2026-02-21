//----------------------------------------------------------------------//
//  Design Note
//----------------------------------------------------------------------//
//  1. Instruction Memory Depth (IMEM): At least 8 kB to run the "isa_1b.hex" or "isa_4b.hex"
//  2. Data        Memory Depth (DMEM): At least 2 kB (0x0000_0000 - 0x0000_07FF)
//  3. IMEM and DMEM are separate memory blocks (Harvard-like structure).




module Adder_Subtractor (
    input  logic [31:0] A,
    input  logic [31:0] B,
	 input logic  [3:0]D,
    output logic [31:0] Sum,
    output logic        CarryOut
);
    logic [31:0]Sub;
    logic b_sel;
	 logic [31:0]c;
    

    assign b_sel = (~D[3] & ~D[2] & ~D[1]& D[0]) | (~D[3] & ~D[2] & D[1]);

    assign Sub =(b_sel) ? ~B : B;


    // Full adder thủ công từng bit
    Full_Adder fa0  (.A(A[0]),  .B(Sub[0]),  .Cin(b_sel),  .S(Sum[0]),  .Cout(c[0]));
    Full_Adder fa1  (.A(A[1]),  .B(Sub[1]),  .Cin(c[0]), .S(Sum[1]),  .Cout(c[1]));
    Full_Adder fa2  (.A(A[2]),  .B(Sub[2]),  .Cin(c[1]), .S(Sum[2]),  .Cout(c[2]));
    Full_Adder fa3  (.A(A[3]),  .B(Sub[3]),  .Cin(c[2]), .S(Sum[3]),  .Cout(c[3]));
    Full_Adder fa4  (.A(A[4]),  .B(Sub[4]),  .Cin(c[3]), .S(Sum[4]),  .Cout(c[4]));
    Full_Adder fa5  (.A(A[5]),  .B(Sub[5]),  .Cin(c[4]), .S(Sum[5]),  .Cout(c[5]));
    Full_Adder fa6  (.A(A[6]),  .B(Sub[6]),  .Cin(c[5]), .S(Sum[6]),  .Cout(c[6]));
    Full_Adder fa7  (.A(A[7]),  .B(Sub[7]),  .Cin(c[6]), .S(Sum[7]),  .Cout(c[7]));
    Full_Adder fa8  (.A(A[8]),  .B(Sub[8]),  .Cin(c[7]), .S(Sum[8]),  .Cout(c[8]));
    Full_Adder fa9  (.A(A[9]),  .B(Sub[9]),  .Cin(c[8]), .S(Sum[9]),  .Cout(c[9]));
    Full_Adder fa10 (.A(A[10]), .B(Sub[10]), .Cin(c[9]), .S(Sum[10]), .Cout(c[10]));
    Full_Adder fa11 (.A(A[11]), .B(Sub[11]), .Cin(c[10]),.S(Sum[11]), .Cout(c[11]));
    Full_Adder fa12 (.A(A[12]), .B(Sub[12]), .Cin(c[11]),.S(Sum[12]), .Cout(c[12]));
    Full_Adder fa13 (.A(A[13]), .B(Sub[13]), .Cin(c[12]),.S(Sum[13]), .Cout(c[13]));
    Full_Adder fa14 (.A(A[14]), .B(Sub[14]), .Cin(c[13]),.S(Sum[14]), .Cout(c[14]));
    Full_Adder fa15 (.A(A[15]), .B(Sub[15]), .Cin(c[14]),.S(Sum[15]), .Cout(c[15]));
    Full_Adder fa16 (.A(A[16]), .B(Sub[16]), .Cin(c[15]),.S(Sum[16]), .Cout(c[16]));
    Full_Adder fa17 (.A(A[17]), .B(Sub[17]), .Cin(c[16]),.S(Sum[17]), .Cout(c[17]));
    Full_Adder fa18 (.A(A[18]), .B(Sub[18]), .Cin(c[17]),.S(Sum[18]), .Cout(c[18]));
    Full_Adder fa19 (.A(A[19]), .B(Sub[19]), .Cin(c[18]),.S(Sum[19]), .Cout(c[19]));
    Full_Adder fa20 (.A(A[20]), .B(Sub[20]), .Cin(c[19]),.S(Sum[20]), .Cout(c[20]));
    Full_Adder fa21 (.A(A[21]), .B(Sub[21]), .Cin(c[20]),.S(Sum[21]), .Cout(c[21]));
    Full_Adder fa22 (.A(A[22]), .B(Sub[22]), .Cin(c[21]),.S(Sum[22]), .Cout(c[22]));
    Full_Adder fa23 (.A(A[23]), .B(Sub[23]), .Cin(c[22]),.S(Sum[23]), .Cout(c[23]));
    Full_Adder fa24 (.A(A[24]), .B(Sub[24]), .Cin(c[23]),.S(Sum[24]), .Cout(c[24]));
    Full_Adder fa25 (.A(A[25]), .B(Sub[25]), .Cin(c[24]),.S(Sum[25]), .Cout(c[25]));
    Full_Adder fa26 (.A(A[26]), .B(Sub[26]), .Cin(c[25]),.S(Sum[26]), .Cout(c[26]));
    Full_Adder fa27 (.A(A[27]), .B(Sub[27]), .Cin(c[26]),.S(Sum[27]), .Cout(c[27]));
    Full_Adder fa28 (.A(A[28]), .B(Sub[28]), .Cin(c[27]),.S(Sum[28]), .Cout(c[28]));
    Full_Adder fa29 (.A(A[29]), .B(Sub[29]), .Cin(c[28]),.S(Sum[29]), .Cout(c[29]));
    Full_Adder fa30 (.A(A[30]), .B(Sub[30]), .Cin(c[29]),.S(Sum[30]), .Cout(c[30]));
    Full_Adder fa31 (.A(A[31]), .B(Sub[31]), .Cin(c[30]),.S(Sum[31]), .Cout(c[31]));

    // Kết quả carry out
    assign CarryOut = c[31];
	 

endmodule


module adder_4bit(

  input  logic [3:0] a, b,

  input  logic cin,

  output logic [3:0] s,

  output logic cout

);

  logic [2:0] c;

  

  Full_Adder adder_bit0(

    .A(a[0]),

	 .B(b[0]),

    .Cin(cin),

	 .S(s[0]),

    .Cout(c[0]));

  

  Full_Adder adder_bit1(

    .A(a[1]),

	 .B(b[1]),

    .Cin(c[0]),

	 .S(s[1]),

    .Cout(c[1]));



    Full_Adder adder_bit2(

    .A(a[2]),

	 .B(b[2]),

    .Cin(c[1]),

	 .S(s[2]),

    .Cout(c[2]));



    Full_Adder adder_bit3(

    .A(a[3]),

	 .B(b[3]),

    .Cin(c[2]),

	 .S(s[3]),

    .Cout(cout));

  

endmodule
module adder_8bit(

  input  logic [7:0] i_a, i_b,

  input  logic i_cin,

  output logic [7:0] o_s,

  output logic o_cout

);

  logic c;

  adder_4bit half_byte0(

    .a(i_a[3:0]),

	 .b(i_b[3:0]),

	 .cin(i_cin),

	 .s(o_s[3:0]),

	 .cout(c));

	 

  adder_4bit half_byte1(

    .a(i_a[7:4]),

	 .b(i_b[7:4]),

	 .cin(c),

	 .s(o_s[7:4]),

	 .cout(o_cout));



endmodule
module adder_32bit(

  input  logic [31:0] i_a, i_b,

  input  logic i_cin,

  output logic [31:0] o_s,

  output logic o_cout

);

  logic [2:0] c;

  

  adder_8bit byte0(

    .i_a(i_a[7:0]),

	 .i_b(i_b[7:0]),

    .i_cin(i_cin),

	 .o_s(o_s[7:0]),

    .o_cout(c[0]));



  adder_8bit byte1(

    .i_a(i_a[15:8]),

	 .i_b(i_b[15:8]),

    .i_cin(c[0]),

	 .o_s(o_s[15:8]),

    .o_cout(c[1]));



  adder_8bit byte2(

    .i_a(i_a[23:16]),

	 .i_b(i_b[23:16]),

    .i_cin(c[1]),

	 .o_s(o_s[23:16]),

    .o_cout(c[2]));



  adder_8bit byte3(

    .i_a(i_a[31:24]),

	 .i_b(i_b[31:24]),

    .i_cin(c[2]),

	 .o_s(o_s[31:24]),

    .o_cout(o_cout));

  

endmodule
module Full_Adder (
  input  logic A, B, Cin,
  output logic S, Cout
);

  

    logic  n1, n2, n3, n4, n5, n6, n7;



    assign n1 = A & ~B;

    assign n2 = ~A & B;

    assign n3 = n1 | n2;      

    assign n4 = n3 & ~Cin;

    assign n5 = ~n3 & Cin;

    assign S  = n4 | n5;      



    assign n6 = A & B;

    assign n7 = n3 & Cin;

    assign Cout = n6 | n7;      



endmodule
module alu (

  input  logic [31:0] i_op_a, i_op_b,

  input  logic  [3:0] i_alu_op,

  output logic [31:0] o_alu_data

);



  localparam ALU_ADD  = 4'b0000;

  localparam ALU_SUB  = 4'b0001;

  localparam ALU_SLL  = 4'b0010;

  localparam ALU_SLT  = 4'b0011;

  localparam ALU_SLTU = 4'b0100;

  localparam ALU_XOR  = 4'b0101;

  localparam ALU_SRL  = 4'b0110;

  localparam ALU_SRA  = 4'b0111;

  localparam ALU_OR   = 4'b1000;

  localparam ALU_AND  = 4'b1001;

  localparam ALU_LUI  = 4'b1010;

  

  logic [31:0] s,b;

  logic borrow, overflow, cout, c;

  assign borrow = ~ cout;

  //tinh toan phep tru

  		  adder_32bit adder(

		    .i_a(i_op_a),

			 .i_b(b),

			 .i_cin(c),

			 .o_s(s),

			. o_cout(cout));

  assign overflow = (i_op_a[31] & ~i_op_b[31] & ~s[31]) | (~i_op_a[31] & i_op_b[31] & s[31]);

// input

  always_comb begin

    case(i_alu_op)

	 ALU_ADD: begin

	   b = i_op_b;

		c = 1'b0;

	 end

	 ALU_SUB: begin

	   b = ~i_op_b;

		c = 1'b1;

	 end

	 ALU_SLL: begin

	   b = i_op_b;

		c = 1'b0;

	 end

	 ALU_SLT: begin

	   b = ~i_op_b;

		c = 1'b1;

	 end

	 ALU_SLTU:begin

	   b = ~i_op_b;

		c = 1'b1;

	 end

	 ALU_XOR: begin

	   b = i_op_b;

		c = 1'b0;

	 end

	 ALU_SRL: begin

	   b = i_op_b;

		c = 1'b0;

	 end

	 ALU_SRA: begin

	   b = i_op_b;

		c = 1'b0;

	 end

	 ALU_OR:  begin

	   b = i_op_b;

		c = 1'b0;

	 end

	 ALU_AND: begin

	   b = i_op_b;

		c = 1'b0;

	 end

	 default: begin

	   b = i_op_b;

		c = 1'b0;

	 end

	 endcase

  end

// output

  always_comb begin

    case(i_alu_op)

	   ALU_ADD: o_alu_data = s; //ADD	

		ALU_SUB: o_alu_data = s; //SUB

		ALU_SLL: begin//SLL

		  case(i_op_b[4:0])

		    5'd0: o_alu_data = i_op_a;

			 5'd1: o_alu_data = {i_op_a[30:0],1'b0};

			 5'd2: o_alu_data = {i_op_a[29:0],2'b0};

			 5'd3: o_alu_data = {i_op_a[28:0],3'b0};

			 5'd4: o_alu_data = {i_op_a[27:0],4'b0};

			 5'd5: o_alu_data = {i_op_a[26:0],5'b0};

			 5'd6: o_alu_data = {i_op_a[25:0],6'b0};

			 5'd7: o_alu_data = {i_op_a[24:0],7'b0};

			 5'd8: o_alu_data = {i_op_a[23:0],8'b0};

			 5'd9: o_alu_data = {i_op_a[22:0],9'b0};

			 5'd10: o_alu_data = {i_op_a[21:0],10'b0};

			 5'd11: o_alu_data = {i_op_a[20:0],11'b0};

			 5'd12: o_alu_data = {i_op_a[19:0],12'b0};

			 5'd13: o_alu_data = {i_op_a[18:0],13'b0};

			 5'd14: o_alu_data = {i_op_a[17:0],14'b0};

			 5'd15: o_alu_data = {i_op_a[16:0],15'b0};

			 5'd16: o_alu_data = {i_op_a[15:0],16'b0};

			 5'd17: o_alu_data = {i_op_a[14:0],17'b0};

			 5'd18: o_alu_data = {i_op_a[13:0],18'b0};

			 5'd19: o_alu_data = {i_op_a[12:0],19'b0};

			 5'd20: o_alu_data = {i_op_a[11:0],20'b0};

			 5'd21: o_alu_data = {i_op_a[10:0],21'b0};

			 5'd22: o_alu_data = {i_op_a[9:0],22'b0};

			 5'd23: o_alu_data = {i_op_a[8:0],23'b0};

			 5'd24: o_alu_data = {i_op_a[7:0],24'b0};

			 5'd25: o_alu_data = {i_op_a[6:0],25'b0};

			 5'd26: o_alu_data = {i_op_a[5:0],26'b0};

			 5'd27: o_alu_data = {i_op_a[4:0],27'b0};

			 5'd28: o_alu_data = {i_op_a[3:0],28'b0};

			 5'd29: o_alu_data = {i_op_a[2:0],29'b0};

			 5'd30: o_alu_data = {i_op_a[1:0],30'b0};

			 5'd31: o_alu_data = {i_op_a[0],31'b0};

			 default: o_alu_data =  32'b0;

		  endcase

		  end

		ALU_SLT: o_alu_data = {30'b0, s[31] ^ overflow};

		ALU_SLTU:o_alu_data = {30'b0, borrow};

		ALU_XOR: o_alu_data = i_op_a ^ i_op_b;                 //XOR

		ALU_SRL: begin//SRL

		  case(i_op_b[4:0])

		    5'd0: o_alu_data = i_op_a;

			 5'd1: o_alu_data = {1'b0,i_op_a[31:1]};

			 5'd2: o_alu_data = {2'b0,i_op_a[31:2]};

			 5'd3: o_alu_data = {3'b0,i_op_a[31:3]};

			 5'd4: o_alu_data = {4'b0,i_op_a[31:4]};

			 5'd5: o_alu_data = {5'b0,i_op_a[31:5]};

			 5'd6: o_alu_data = {6'b0,i_op_a[31:6]};

			 5'd7: o_alu_data = {7'b0,i_op_a[31:7]};

			 5'd8: o_alu_data = {8'b0,i_op_a[31:8]};

			 5'd9: o_alu_data = {9'b0,i_op_a[31:9]};

			 5'd10: o_alu_data = {10'b0,i_op_a[31:10]};

			 5'd11: o_alu_data = {11'b0,i_op_a[31:11]};

			 5'd12: o_alu_data = {12'b0,i_op_a[31:12]};

			 5'd13: o_alu_data = {13'b0,i_op_a[31:13]};

			 5'd14: o_alu_data = {14'b0,i_op_a[31:14]};

			 5'd15: o_alu_data = {15'b0,i_op_a[31:15]};

			 5'd16: o_alu_data = {16'b0,i_op_a[31:16]};

			 5'd17: o_alu_data = {17'b0,i_op_a[31:17]};

			 5'd18: o_alu_data = {18'b0,i_op_a[31:18]};

			 5'd19: o_alu_data = {19'b0,i_op_a[31:19]};

			 5'd20: o_alu_data = {20'b0,i_op_a[31:20]};

			 5'd21: o_alu_data = {21'b0,i_op_a[31:21]};

			 5'd22: o_alu_data = {22'b0,i_op_a[31:22]};

			 5'd23: o_alu_data = {23'b0,i_op_a[31:23]};

			 5'd24: o_alu_data = {24'b0,i_op_a[31:24]};

			 5'd25: o_alu_data = {25'b0,i_op_a[31:25]};

			 5'd26: o_alu_data = {26'b0,i_op_a[31:26]};

			 5'd27: o_alu_data = {27'b0,i_op_a[31:27]};

			 5'd28: o_alu_data = {28'b0,i_op_a[31:28]};

			 5'd29: o_alu_data = {29'b0,i_op_a[31:29]};

			 5'd30: o_alu_data = {30'b0,i_op_a[31:30]};

			 5'd31: o_alu_data = {31'b0,i_op_a[31]};

			 default: o_alu_data =  32'b0;

		  endcase

		  end

		ALU_SRA: begin//SRA

		  case(i_op_b[4:0])

		    5'd0: o_alu_data = i_op_a;

			 5'd1: o_alu_data = {i_op_a[31],i_op_a[31:1]};

			 5'd2: o_alu_data = {{2{i_op_a[31]}},i_op_a[31:2]};

			 5'd3: o_alu_data = {{3{i_op_a[31]}},i_op_a[31:3]};

			 5'd4: o_alu_data = {{4{i_op_a[31]}},i_op_a[31:4]};

			 5'd5: o_alu_data = {{5{i_op_a[31]}},i_op_a[31:5]};

			 5'd6: o_alu_data = {{6{i_op_a[31]}},i_op_a[31:6]};

			 5'd7: o_alu_data = {{7{i_op_a[31]}},i_op_a[31:7]};

			 5'd8: o_alu_data = {{8{i_op_a[31]}},i_op_a[31:8]};

			 5'd9: o_alu_data = {{9{i_op_a[31]}},i_op_a[31:9]};

			 5'd10: o_alu_data = {{10{i_op_a[31]}},i_op_a[31:10]};

			 5'd11: o_alu_data = {{11{i_op_a[31]}},i_op_a[31:11]};

			 5'd12: o_alu_data = {{12{i_op_a[31]}},i_op_a[31:12]};

			 5'd13: o_alu_data = {{13{i_op_a[31]}},i_op_a[31:13]};

			 5'd14: o_alu_data = {{14{i_op_a[31]}},i_op_a[31:14]};

			 5'd15: o_alu_data = {{15{i_op_a[31]}},i_op_a[31:15]};

			 5'd16: o_alu_data = {{16{i_op_a[31]}},i_op_a[31:16]};

			 5'd17: o_alu_data = {{17{i_op_a[31]}},i_op_a[31:17]};

			 5'd18: o_alu_data = {{18{i_op_a[31]}},i_op_a[31:18]};

			 5'd19: o_alu_data = {{19{i_op_a[31]}},i_op_a[31:19]};

			 5'd20: o_alu_data = {{20{i_op_a[31]}},i_op_a[31:20]};

			 5'd21: o_alu_data = {{21{i_op_a[31]}},i_op_a[31:21]};

			 5'd22: o_alu_data = {{22{i_op_a[31]}},i_op_a[31:22]};

			 5'd23: o_alu_data = {{23{i_op_a[31]}},i_op_a[31:23]};

			 5'd24: o_alu_data = {{24{i_op_a[31]}},i_op_a[31:24]};

			 5'd25: o_alu_data = {{25{i_op_a[31]}},i_op_a[31:25]};

			 5'd26: o_alu_data = {{26{i_op_a[31]}},i_op_a[31:26]};

			 5'd27: o_alu_data = {{27{i_op_a[31]}},i_op_a[31:27]};

			 5'd28: o_alu_data = {{28{i_op_a[31]}},i_op_a[31:28]};

			 5'd29: o_alu_data = {{29{i_op_a[31]}},i_op_a[31:29]};

			 5'd30: o_alu_data = {{30{i_op_a[31]}},i_op_a[31:30]};

			 5'd31: o_alu_data = {{31{i_op_a[31]}},i_op_a[31]};

			 default: o_alu_data =  32'b0;

		  endcase

		end

		ALU_OR : o_alu_data = i_op_a | i_op_b;                 //OR

		ALU_AND: o_alu_data = i_op_a & i_op_b;                 //AND

		ALU_LUI: o_alu_data = i_op_b;

		default: o_alu_data = 32'b0;

	 endcase

  end

endmodule

	


module BRC
(
	input logic [31:0] i_rs1_data,
	input logic [31:0] i_rs2_data,
	input logic i_br_un,
	output logic o_br_less,
	output logic o_br_equal
);


	logic Less_un, Less_si;
	
Comp32_32 inst1
(
	.A(i_rs1_data),
	.B(i_rs2_data),
	.Less(Less_un),
	.Equal(o_br_equal)
);

Comp32_32 inst2
(
	.A({1'b0, i_rs1_data[30:0]}),
	.B({1'b0, i_rs2_data[30:0]}),
	.Less(Less_si),
	.Equal()
);

	always_comb begin
		if(~i_br_un) begin
			o_br_less = ~ (o_br_equal) & ((i_rs1_data[31] & ~ i_rs2_data[31]) | (~i_rs1_data[31] & ~i_rs2_data[31] & Less_si) | (i_rs1_data[31] & i_rs2_data[31] & Less_si)); 
		end
		else begin
			o_br_less = Less_un;
		end
	end
	
endmodule
module Comp2_2
(
	input logic Equ,
	input logic [1:0] A,
	input logic [1:0] B,
	output logic Less,
	output logic Equal
);
	logic eq, le;
	 assign eq = ((A[1] & B[1]) | (~A[1] & ~B[1])) & ((A[0] & B[0]) | (~A[0] & ~B[0]));
	assign le = (~A[1] & B[1]) | (B[1] & ~A[0] & B[0]) | (~A[1] & ~A[0] & B[0]); 
	
	assign Equal = eq & Equ;
	assign Less = le & Equ;
	
endmodule
module Comp8_8
(
	input logic Equ,
	input logic [7:0] A,
	input logic [7:0] B,
	output logic Less,
	output logic Equal
);

	logic L1, L2, L3, L4;
	logic E1, E2, E3;
	
Comp2_2 inst1 
(
	.Equ(1'b1),
	.A(A[7:6]),
	.B(B[7:6]),
	.Less(L1),
	.Equal(E1)
);

Comp2_2 inst2 
(
	.Equ(E1),
	.A(A[5:4]),
	.B(B[5:4]),
	.Less(L2),
	.Equal(E2)
);

Comp2_2 inst3 
(
	.Equ(E2),
	.A(A[3:2]),
	.B(B[3:2]),
	.Less(L3),
	.Equal(E3)
);

Comp2_2 inst4
(
	.Equ(E3),
	.A(A[1:0]),
	.B(B[1:0]),
	.Less(L4),
	.Equal(Equal)
);

	assign Less = L1 | L2 | L3 | L4;
	
endmodule

module Comp32_32
(
	input logic [31:0] A,
	input logic [31:0] B,
	output logic Less,
	output logic Equal
);


	logic L1, L2, L3, L4;
	logic E1, E2, E3;
	

Comp8_8 inst1 
(
	.Equ(1'b1),
	.A(A[31:24]),
	.B(B[31:24]),
	.Less(L1),
	.Equal(E1)
);

Comp8_8 inst2 
(
	.Equ(E1),
	.A(A[23:16]),
	.B(B[23:16]),
	.Less(L2),
	.Equal(E2)
);

Comp8_8 inst3 
(
	.Equ(E2),
	.A(A[15:8]),
	.B(B[15:8]),
	.Less(L3),
	.Equal(E3)
);

Comp8_8 inst4 
(
	.Equ(E3),
	.A(A[7:0]),
	.B(B[7:0]),
	.Less(L4),
	.Equal(Equal)
);
	
	assign Less = L1 | L2 | L3 | L4;

endmodule

 module control (
  input  logic [31:0] i_instr,
  input  logic i_br_less, i_br_equal,
  output logic o_insn_vld,
  output logic o_rd_wren, o_br_un, o_mem_wren,
  output logic o_pc_sel, o_opa_sel, o_opb_sel, 
  output logic [1:0] o_wb_sel,
  output logic [3:0] o_alu_op
);
  
  logic [6:0] opcode;
  logic [2:0] funct3;
  logic       funct7;
  logic [1:0] alu_dec;
  assign opcode = i_instr[6:0];
  assign funct3 = i_instr[14:12];
  assign funct7 = i_instr[30];
 
 always_comb begin
        o_pc_sel   = 0 ;
		  o_rd_wren  = 0 ;
		  o_opa_sel  = 0 ;
		  o_opb_sel  = 0 ;
		  o_mem_wren = 0 ;
		  o_wb_sel   = 2'b11;
		  o_insn_vld = 1;
		  o_br_un    = 0;
    case(opcode)
	   7'b0110011: begin //R-type
		  o_pc_sel   = 0 ;
		  o_rd_wren  = 1 ; 
		  o_opa_sel  = 0 ;
		  o_opb_sel  = 0 ;
		  alu_dec    = 2'b01;
		  o_mem_wren = 0 ;
		  o_wb_sel   = 2'b01;
		  o_insn_vld = 1 ;
		  end
	   7'b0010011: begin //I-type
		  o_pc_sel   = 0 ;
		  o_rd_wren  = 1 ; 
		  o_opa_sel  = 0 ;
		  o_opb_sel  = 1 ;
		  alu_dec    = 2'b01;
		  o_mem_wren = 0 ;
		  o_wb_sel   = 2'b01;
		  o_insn_vld = 1 ;
		  end
	   7'b0000011: begin //Load-type
		  o_pc_sel   = 0 ;
		  o_rd_wren  = 1 ; 
		  o_opa_sel  = 0 ;
		  o_opb_sel  = 1 ;
		  alu_dec    = 2'b00;
		  o_mem_wren = 0 ;
		  o_wb_sel   = 2'b00;
		  o_insn_vld = 1 ;
		  end
	   7'b0100011: begin //S
		  o_pc_sel   = 0 ;
		  o_rd_wren  = 0 ; 
		  o_opa_sel  = 0 ;
		  o_opb_sel  = 1 ;
		  alu_dec    = 2'b00;
		  o_mem_wren = 1 ; 
		  o_insn_vld = 1 ;
		  end
	   7'b1100011: begin //B
		  case(funct3)
		    3'b000:begin //BEQ
			   o_br_un    = 0;
			   o_pc_sel   = i_br_equal ;
            o_insn_vld = 1;
			   end
			 3'b001: begin //BNE
			   o_br_un    = 0;
			   o_pc_sel   = ~i_br_equal;
				o_insn_vld = 1;
			   end
			 3'b100: begin //BLT
			   o_br_un    = 0;
			   o_pc_sel   = i_br_less ;
				o_insn_vld = 1;
			   end
			 3'b101: begin  //BGE
			   o_br_un    = 0;
			   o_pc_sel   = ~i_br_less;
				o_insn_vld = 1;
			   end
			 3'b110: begin  //BLTU
			   o_br_un    = 1;
			   o_pc_sel   = i_br_less;
				o_insn_vld = 1;
			   end
			 3'b111: begin  //BGEU
			   o_br_un    = 1;
			   o_pc_sel   = ~i_br_less ;
				o_insn_vld = 1;
			   end
			 default: begin
			   o_br_un    = 0;
			   o_pc_sel   = 0;
				o_insn_vld = 0;
			   end
		  endcase
		  o_rd_wren  = 0 ;
		  o_opa_sel  = 1 ;
		  o_opb_sel  = 1 ;
		  alu_dec    = 2'b00;
		  o_mem_wren = 0 ;
		  o_wb_sel   = 2'b01 ; 
		  end
	   7'b1101111: begin  //J
		  o_pc_sel   = 1'b1 ;
		  o_rd_wren  = 1'b1 ; 
		  o_opa_sel  = 1'b1 ;
		  o_opb_sel  = 1'b1 ;
		  alu_dec    = 2'b00;
		  o_mem_wren = 1'b0 ;
		  o_wb_sel   = 2'b10;
		  o_insn_vld = 1'b1 ;
		  end
	   7'b0110111: begin  // LUI
		  o_pc_sel   = 1'b0 ;
		  o_rd_wren  = 1'b1 ; 
		  o_opb_sel  = 1'b1 ;
		  alu_dec    = 2'b10;
		  o_mem_wren = 1'b0 ;
		  o_wb_sel   = 2'b01;
		  o_insn_vld = 1'b1 ;
		  end
	   7'b0010111: begin  // AUIPC
		  o_pc_sel   = 1'b0 ;
		  o_rd_wren  = 1'b1 ; 
		  o_opa_sel  = 1'b1 ; 
		  o_opb_sel  = 1'b1 ;
		  alu_dec    = 2'b00;
		  o_mem_wren = 1'b0 ;
		  o_wb_sel   = 2'b01;
		  o_insn_vld = 1'b1 ;
		  end
	   7'b1100111: begin  // JALR
		  o_pc_sel   = 1'b1 ;
		  o_rd_wren  = 1'b1 ;
		  o_opa_sel  = 1'b0 ; 
		  o_opb_sel  = 1'b1 ;
		  alu_dec    = 2'b00;
		  o_mem_wren = 1'b0 ;
		  o_wb_sel   = 2'b10;
		  o_insn_vld = 1'b1 ;
		  end
		default: begin
		  o_pc_sel   = 1'b0 ;
		  o_rd_wren  = 1'b0 ;
		  o_opa_sel  = 1'b0 ; 
		  o_opb_sel  = 1'b0 ;
		  alu_dec    = 2'b00;
		  o_mem_wren = 1'b0 ;
		  o_wb_sel   = 2'b01;
		  o_insn_vld = 1'b0 ;
		  end
	 endcase
  end

  // dieu khien alu 
  alu_control alu_ctrl(
    .i_alu_dec(alu_dec),
    .i_funct3(funct3),
    .i_funct7(funct7),
	 .i_opcode5(i_instr[5]),
    .o_alu_op(o_alu_op)
  );
  
endmodule 
module alu_control(
  input  logic [1:0] i_alu_dec,
  input  logic [2:0] i_funct3,
  input  logic       i_funct7,i_opcode5,
  output logic [3:0]  o_alu_op
);

  always_comb begin
    case(i_alu_dec)
	   2'b00: o_alu_op = 4'b0000;
	   2'b01: begin //R-type,Itype
		  case(i_funct3)
		    3'b000: o_alu_op = ((i_funct7 == 1'b1) && (i_opcode5 == 1'b1)) ? 4'b0001 : 4'b0000; //ADD, SUB
			 3'b001: o_alu_op = 4'b0010; //SLL
			 3'b010: o_alu_op = 4'b0011; //SLT
			 3'b011: o_alu_op = 4'b0100; //SLTU
			 3'b100: o_alu_op = 4'b0101; //XOR
			 3'b101: o_alu_op = (i_funct7 == 1'b0) ? 4'b0110 : 4'b0111; //SRL, SRA
			 3'b110: o_alu_op = 4'b1000; //OR
			 3'b111: o_alu_op = 4'b1001; //AND
		  endcase
		  end
		2'b10: o_alu_op = 4'b1010; // lui
		default: o_alu_op = 4'b0000;
	 endcase
  end
  endmodule 


module decoder5to32 (

    input  logic        EN,

    input  logic [4:0]  A,

    output logic [31:0] f

);

    always_comb begin

        f = 32'b0;          

        if (EN)             

            f[A] = 1'b1;    

    end

endmodule
module D_FF_master_slave_gate (
    input  logic D,
    input  logic i_clk,
    input  logic i_reset,  // active high reset
    output logic Q
);
    logic nclk;
    logic master, master_bar;
    logic slave, slave_bar;
    logic n1m, n2m, n1s, n2s;

    assign nclk = ~i_clk;

    // --- master latch (hoạt động khi i_clk = 0) ---
    assign n1m        = ~(D & nclk & ~i_reset);
    assign n2m        = ~(~D & nclk & ~i_reset);
    assign master     = ~(n1m & master_bar);
    assign master_bar = ~(n2m & master);

    // --- slave latch (hoạt động khi i_clk = 1) ---
    assign n1s      = ~(master & i_clk & ~i_reset);
    assign n2s      = ~(~master & i_clk & ~i_reset);
    assign slave    = ~(n1s & slave_bar);
    assign slave_bar = ~(n2s & slave);

    // --- reset và output ---
    assign Q = i_reset ? 0 : slave;

endmodule
module D_FF_32bit (
    input  logic [31:0] D,
    input  logic        i_clk,
	   input  logic        i_reset,
	 
    output logic [31:0] Q
);
    genvar i;
    generate
        for (i = 0; i < 32; i++) begin : GEN_DFF
            D_FF_master_slave_gate dff_bit (
                .D   (D[i]),
                .i_clk(i_clk),
					 .i_reset (i_reset),
                .Q   (Q[i])
              
            );
        end
    endgenerate
endmodule



module imem (
    input  logic [31:0] i_addr,
    output logic [31:0] o_rdata
);
    parameter MEM_SIZE = 8191;

    logic [31:0] mem [0:MEM_SIZE-1];
    assign o_rdata = mem[i_addr[12:2]];


   initial begin
    integer i;
    for (i=0; i < MEM_SIZE; i++) mem[i] = 32'b0;
    $readmemh("./../02_test/isa_4b.hex",mem);
  end
endmodule
module immgen (
  input  logic [31:0] i_inst,
  output logic [31:0] o_imm
);
logic [6:0] opcode;
assign opcode = i_inst[6:0];
  always_comb begin
    case(opcode)
		7'b0010011: o_imm = {{21{i_inst[31]}},i_inst[30:20]};// I
		7'b0000011: o_imm = {{21{i_inst[31]}},i_inst[30:20]};//L 
		7'b0100011: o_imm = {{20{i_inst[31]}},i_inst[31:25],i_inst[11:7]};// S
		7'b1100011: o_imm = {{20{i_inst[31]}},i_inst[7],i_inst[30:25],i_inst[11:8],1'b0};// B
		7'b1101111: o_imm = {{12{i_inst[31]}},i_inst[19:12],i_inst[20],i_inst[30:21],1'b0};// J
		7'b0110111, 7'b0010111 : o_imm = {i_inst[31:12],12'b0};// U
		7'b1100111: o_imm = {{21{i_inst[31]}},i_inst[30:20]};// Jalr
		default:    o_imm = 32'b0;
	 endcase
  end
endmodule 

module lsu
(
	input logic i_clk,
	input logic i_reset,
	input logic [31:0] i_lsu_addr,
	input logic [31:0] i_st_data,
	input logic i_lsu_wren,
	input logic [31:0] i_io_sw,
	input logic [2:0] i_funct3,
	output logic [31:0] o_ld_data,
	output logic [31:0] o_io_ledr,
	output logic [31:0] o_io_ledg
);

	logic [31:0] input_buffer;
	logic [31:0] output_buffer_ledr;
	logic [31:0] output_buffer_ledg;
	
	logic mem, rser_1, led_r, led_g, switch, rser_2;
	
	assign o_io_ledr = output_buffer_ledr;
	assign o_io_ledg = output_buffer_ledg;
	
	
	assign mem = ~i_lsu_addr[28] & ~(|i_lsu_addr[27:16]) & ~(|i_lsu_addr[15:12]) & ~i_lsu_addr[11];
	assign rser_1 = ~i_lsu_addr[28] & ((|i_lsu_addr[27:16]) | (|i_lsu_addr[15:12]) | i_lsu_addr[11]);
	assign led_r = i_lsu_addr[28] & ~(|i_lsu_addr[27:12]);
	assign led_g = i_lsu_addr[28] & ~(|i_lsu_addr[27:13]) & i_lsu_addr[12];
	assign switch = i_lsu_addr[28] & ~(|i_lsu_addr[27:17]) & i_lsu_addr[16] & ~(|i_lsu_addr[15:12]);
	assign rser_2 = ~mem & ~rser_1 & ~led_r & ~led_g & ~switch;
	logic [5:0] select;
	assign select = {mem, rser_1, led_r, led_g, switch, rser_2};

	
	logic [31:0] read_data;
	logic [3:0] bmask;
	logic [31:0] data_write;
memory inst 
(
	.i_clk(i_clk),
	.i_reset(i_reset),
	.addr(i_lsu_addr[10:2]),			    // 512 địa chỉ (0 đến 511)
	.i_wdata(data_write),		    // Dữ liệu ghi 32 bit
	.i_bmask(bmask),		    // Byte Mask (4 bit)
	.i_wren(i_lsu_wren),			    // Kích hoạt ghi
	.o_rdata(read_data)
);
	always_comb begin											//Hệ tổ hợp dùng để đọc ra load_data và tạo ra biến điều khiển cho hệ tuần tự ghi
		case(select) 
			6'b100_000: begin									//MEM
				case(i_funct3) 
					3'b010: begin								//LW
						o_ld_data = read_data;
					end
					3'b001: begin								//LH
						case(i_lsu_addr[1])
							1'b0: begin
								o_ld_data = {{16{read_data[15]}},read_data[15:0]};
							end
							1'b1: begin
								o_ld_data = {{16{read_data[31]}},read_data[31:16]};
							end
						endcase
					end
					3'b000: begin								//LB
						case(i_lsu_addr[1:0])
							2'b00: begin
								o_ld_data = {{24{read_data[7]}},read_data[7:0]};
							end
							2'b01: begin
								o_ld_data = {{24{read_data[15]}},read_data[15:8]};
							end
							2'b10: begin
								o_ld_data = {{24{read_data[23]}},read_data[23:16]};
							end
							2'b11: begin
								o_ld_data = {{24{read_data[31]}},read_data[31:24]};
							end
						endcase
					end
					3'b101: begin								//LHU
						case(i_lsu_addr[1])
							1'b0: begin
								o_ld_data = {16'd0,read_data[15:0]};
							end
							1'b1: begin
								o_ld_data = {16'd0,read_data[31:16]};
							end
						endcase
					end
					3'b100: begin								//LBU
						case(i_lsu_addr[1:0])
							2'b00: begin
								o_ld_data = {24'd0,read_data[7:0]};
							end
							2'b01: begin
								o_ld_data = {24'd0,read_data[15:8]};
							end
							2'b10: begin
								o_ld_data = {24'd0,read_data[23:16]};
							end
							2'b11: begin
								o_ld_data = {24'd0,read_data[31:24]};
							end
						endcase
					end
					default: begin
						o_ld_data = read_data;
					end
				endcase
			end
			6'b010_000: begin									//RESERVED1
				o_ld_data = 32'd0;
			end
			6'b001_000: begin									//LED_RED
				o_ld_data = output_buffer_ledr;
			end
			6'b000_100: begin									//LED_GREEN
				o_ld_data = output_buffer_ledg;
			end
			6'b000_010: begin									//SWITCHES
				o_ld_data = input_buffer;
			end
			6'b000_001: begin									//RESERVED2
				o_ld_data = 32'd0;
			end
			default: begin
				o_ld_data = 32'd0;
			end
		endcase
	end
	
	
	always_comb begin
		if(i_lsu_wren) begin
				if(mem) begin
					case(i_funct3) 
						3'b000: begin										//SB
							case(i_lsu_addr[1:0]) 
								2'b00: begin
									data_write = {24'b0, i_st_data[7:0]};
									bmask = 4'b0001;
								end
								2'b01: begin
									data_write = {16'b0, i_st_data[7:0], 8'b0};
									bmask = 4'b0010;
								end
								2'b10: begin
									data_write = {8'b0, i_st_data[7:0], 16'b0};
									bmask = 4'b0100;
								end
								2'b11: begin
									data_write = {i_st_data[7:0], 24'b0};
									bmask = 4'b1000;
								end
							endcase
						end
						3'b001: begin										//SH
							case(i_lsu_addr[1]) 
								1'b0: begin
									data_write = {16'b0, i_st_data[15:0]};
									bmask = 4'b0011;
								end
								1'b1: begin
									data_write = {i_st_data[15:0], 16'b0};
									bmask = 4'b1100;
								end
							endcase
						end
						3'b010: begin										//SW
							data_write = i_st_data;
							bmask = 4'b1111;
						end
						default: begin	
							data_write = i_st_data;
							bmask = 4'b1111;
						end
					endcase
				end
				else begin
					data_write = 32'b0;
					bmask = 4'b0000;
				end
			end
			else begin
				data_write = 32'b0;
				bmask = 4'b0000;
			end
	end
	
	always @ (posedge i_clk or posedge i_reset) begin		//Hệ tuần tự dùng để ghi
		if(i_reset) begin
			output_buffer_ledr <= 32'd0;
			output_buffer_ledg <= 32'd0;
		end
		else begin
			input_buffer <= i_io_sw;
			if(i_lsu_wren) begin
				if(led_r) begin
					output_buffer_ledr <= i_st_data;
				end
				else if(led_g) begin
					output_buffer_ledg <= i_st_data;
				end	
			end
		end
	end
endmodule


module memory
(
	input i_clk,
	input i_reset,
	input [8:0] addr,			    // 512 địa chỉ (0 đến 511)
	input [31:0] i_wdata,		    // Dữ liệu ghi 32 bit
	input [3:0] i_bmask,		    // Byte Mask (4 bit)
	input i_wren,			    // Kích hoạt ghi
	output [31:0] o_rdata
);
        reg [7:0] dmem0 [0:511];
        reg [7:0] dmem1 [0:511];
        reg [7:0] dmem2 [0:511];
        reg [7:0] dmem3 [0:511];
	
	assign o_rdata = {dmem3[addr], dmem2[addr], dmem1[addr], dmem0[addr]};
	
	
	always @ (posedge i_clk) begin
		if(i_reset) begin
			for (int i = 0; i < 512; i++) begin
				dmem0[i] <= 8'b0;
				dmem1[i] <= 8'b0;
				dmem2[i] <= 8'b0;
				dmem3[i] <= 8'b0;
			end
		end
		else begin
			if(i_wren) begin
				if(i_bmask[0]) begin
					dmem0[addr] <= i_wdata[7:0];
				end
				if(i_bmask[1]) begin
					dmem1[addr] <= i_wdata[15:8];
				end
				if(i_bmask[2]) begin
					dmem2[addr]<= i_wdata[23:16];
				end
				if(i_bmask[3]) begin
					dmem3[addr] <= i_wdata[31:24];
				end
			end
		end
	end
	
	
	
endmodule
 module mux2_1(
	input logic  [31:0] a,
	input logic  [31:0] b,
	input logic sel,
	output logic  [31:0] c
	);
	assign c = sel? b:a;
endmodule
module mux4to1(
  input  logic [31:0] a,b,c,
  input  logic [1:0] sel,
  output logic [31:0] y
);
  always_comb begin
    case(sel)
	   2'b00  : y = a  ;
		2'b01  : y = b  ;
		2'b10  : y = c  ;
		default: y = 32'b0;
	 endcase
  end
endmodule
module mux16_1(
	input logic [31:0] s0,
	input logic [31:0] s1,
	input logic [31:0] s2,
	input logic [31:0] s3,
	input logic [31:0] s4,
	input logic [31:0] s5,
	input logic [31:0] s6,
	input logic [31:0] s7,
	input logic [31:0] s8,
	input logic [31:0] s9,
	input logic [31:0] s10,
	input logic [31:0] s11,
	input logic [31:0] s12,
	input logic [31:0] s13,
	input logic [31:0] s14,
	input logic [31:0] s15,
	output logic [31:0] y,
	input logic [3:0] sel
);
	//ngo ra tang 1
	logic [31:0] c0;
	logic [31:0] c1;
	logic [31:0] c2;
	logic [31:0] c3;
	logic [31:0] c4;
	logic [31:0] c5;
	logic [31:0] c6;
	logic [31:0] c7;
	//tang 1
	mux2_1 mux1_0 (.a(s0), .b(s1), .sel(sel[0]), .c(c0));
	mux2_1 mux1_1 (.a(s2), .b(s3), .sel(sel[0]), .c(c1));
	mux2_1 mux1_2 (.a(s4), .b(s5), .sel(sel[0]), .c(c2));
	mux2_1 mux1_3 (.a(s6), .b(s7), .sel(sel[0]), .c(c3));
	mux2_1 mux1_4 (.a(s8), .b(s9), .sel(sel[0]), .c(c4));
	mux2_1 mux1_5 (.a(s10), .b(s11), .sel(sel[0]), .c(c5));
	mux2_1 mux1_6 (.a(s12), .b(s13), .sel(sel[0]), .c(c6));
	mux2_1 mux1_7 (.a(s14), .b(s15), .sel(sel[0]), .c(c7));
	
	//ngo ta tang 2
	logic [31:0] d0;
	logic [31:0] d1;
	logic [31:0] d2;
	logic [31:0] d3;
	//tang 2
	mux2_1 muxB_0 (.a(c0), .b(c1), .sel(sel[1]), .c(d0));
	mux2_1 muxB_1 (.a(c2), .b(c3), .sel(sel[1]), .c(d1));
	mux2_1 muxB_2 (.a(c4), .b(c5), .sel(sel[1]), .c(d2));
	mux2_1 muxB_3 (.a(c6), .b(c7), .sel(sel[1]), .c(d3));
	
	//ngo ra tang 3
	logic [31:0] e0;
	logic [31:0] e1;
	//tang 3
	mux2_1 mux3_1 (.a(d0), .b(d1), .sel(sel[2]), .c(e0));
	mux2_1 mux3_2 (.a(d2), .b(d3), .sel(sel[2]), .c(e1));
	//tang 4
	mux2_1 mux4_0 (.a(e0), .b(e1), .sel(sel[3]), .c(y));
	endmodule
module mux32_1 (
    input  logic [31:0] s [31:0],
    input  logic [4:0]  sel,
    output logic [31:0] y
);
    // --- Tầng 1: 32 -> 16 ---
    logic [31:0] c [15:0];
    genvar i1;
    generate
        for (i1 = 0; i1 < 16; i1 = i1 + 1) begin : TANG1
            localparam int j1 = i1 + i1; // thay cho i1*2
            mux2_1 m1 (
                .a(s[j1]),
                .b(s[j1+1]),
                .sel(sel[0]),
                .c(c[i1])
            );
        end
    endgenerate

    // --- Tầng 2: 16 -> 8 ---
    logic [31:0] d [7:0];
    genvar i2;
    generate
        for (i2 = 0; i2 < 8; i2 = i2 + 1) begin : TANG2
            localparam int j2 = i2 + i2; // thay cho i2*2
            mux2_1 m2 (
                .a(c[j2]),
                .b(c[j2+1]),
                .sel(sel[1]),
                .c(d[i2])
            );
        end
    endgenerate

    // --- Tầng 3: 8 -> 4 ---
    logic [31:0] e [3:0];
    genvar i3;
    generate
        for (i3 = 0; i3 < 4; i3 = i3 + 1) begin : TANG3
            localparam int j3 = i3 + i3; // thay cho i3*2
            mux2_1 m3 (
                .a(d[j3]),
                .b(d[j3+1]),
                .sel(sel[2]),
                .c(e[i3])
            );
        end
    endgenerate

    // --- Tầng 4: 4 -> 2 ---
    logic [31:0] f [1:0];
    genvar i4;
    generate
        for (i4 = 0; i4 < 2; i4 = i4 + 1) begin : TANG4
            localparam int j4 = i4 + i4; // thay cho i4*2
            mux2_1 m4 (
                .a(e[j4]),
                .b(e[j4+1]),
                .sel(sel[3]),
                .c(f[i4])
            );
        end
    endgenerate

    // --- Tầng 5: 2 -> 1 ---
    mux2_1 m5 (
        .a(f[0]),
        .b(f[1]),
        .sel(sel[4]),
        .c(y)
    );
endmodule

module pc_plus4 (
    input  logic [31:0] i_pc,
    output logic [31:0] o_pc_plus4
);
    logic [31:0] const_4 = 32'h4;

    Adder_Subtractor add_pc4 (
        .A(i_pc),
        .B(const_4),
	.D(4'd0),
        .Sum(o_pc_plus4),
        .CarryOut()          // không dùng
    );
endmodule
module pc_reg (
    input  logic        i_clk,
    input  logic        i_reset,
    input  logic [31:0] i_pc_next,
    output logic [31:0] o_pc
);
    always_ff @(posedge i_clk or posedge i_reset) begin
        if (i_reset)
            o_pc <= 32'd0;
        else
            o_pc <= i_pc_next;
    end
endmodule
module pc1(
    input  logic        i_clk,      
    input  logic        i_reset,      
    input  logic        pc_sel,     
    input  logic [31:0] i_alu_data, 
    output logic [31:0] o_pc,
    input logic [31:0] pc_cong4,
    output logic [31:0] pc_next          
);

 

    pc_plus4 u_pc_plus4 (
        .i_pc(o_pc),
        .o_pc_plus4(pc_cong4)
    );

    mux2_1 u_mux_pc (
        .a(pc_cong4),
        .b(i_alu_data),
        .sel(pc_sel),
        .c(pc_next)
    );

    pc_reg u_pc_reg (
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_pc_next(pc_next),
        .o_pc(o_pc)
    );

endmodule
module regfile (
    input  logic        i_clk,
    input  logic        i_reset,              
    input  logic [4:0]  i_rs1_addr,
    input  logic [4:0]  i_rs2_addr,
    input  logic [4:0]  i_rd_addr,
    input  logic [31:0] i_rd_data,
    input  logic        i_rd_wren,
    output logic [31:0] o_rs1_data,
    output logic [31:0] o_rs2_data 
);	
    logic [31:0] regs [31:0];
    logic [31:0] we_line;

    // Decoder tạo enable ghi
    decoder5to32 u_dec (
        .A (i_rd_addr),
        .EN   (i_rd_wren),
        .f (we_line)
    );

// 32 registers (regs[0] luôn bằng 0)

       thanh_ghi u_thanhghi(
		 .i_clk (i_clk),
		 .i_reset(i_reset),
	    .i_rd_data (i_rd_data),
		 .we_line (we_line),
		 .regs (regs)
		 );

    
mux32_1 u_mux_rs1 (
    .s   (regs),
    .sel (i_rs1_addr),
    .y   (o_rs1_data)
);

mux32_1 u_mux_rs2 (
    .s   (regs),
    .sel (i_rs2_addr),
    .y   (o_rs2_data)
);
endmodule

module thanh_ghi(
    input  logic        i_clk,
	 input  logic        i_reset,
    input  logic [31:0] we_line,
    input  logic [31:0] i_rd_data,
    output logic [31:0] regs [31:0]
   
);
    logic [31:0] D_in [31:0];

    genvar i;


assign regs[0] = 32'b0;
generate
    for (i = 1; i < 32; i++) begin : GEN_REG
        assign D_in[i] = (regs[i] & {32{~we_line[i]}}) | (i_rd_data & {32{we_line[i]}});
        D_FF_32bit u_dff32 (
            .i_clk   (i_clk),
            .i_reset (i_reset),
            .D       (D_in[i]),
            .Q       (regs[i])
        );
    end
endgenerate
endmodule






