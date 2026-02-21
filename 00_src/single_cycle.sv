module single_cycle (
    input  logic         i_clk     ,
    input  logic         i_reset   ,
    input  logic [31:0]  i_io_sw   ,
    output logic [31:0]  o_io_ledr ,
    output logic [31:0]  o_io_ledg ,
    output logic [31:0]  o_io_lcd  ,
    output logic [ 6:0]  o_io_hex0 ,
    output logic [ 6:0]  o_io_hex1 ,
    output logic [ 6:0]  o_io_hex2 ,
    output logic [ 6:0]  o_io_hex3 ,
    output logic [ 6:0]  o_io_hex4 ,
    output logic [ 6:0]  o_io_hex5 ,
    output logic [ 6:0]  o_io_hex6 ,
    output logic [ 6:0]  o_io_hex7 ,
    output logic [31:0]  o_pc_debug,
    output logic         o_insn_vld
);



// Top level file of your milestone 2
// Write your code here

logic [31:0] pc_next, pc, pc_four, alu_data;
  logic [31:0] instr;
  logic [31:0] rs1_data, rs2_data, imm;
  logic [31:0] operand_a, operand_b;
  logic [31:0] ld_data;
  logic [31:0] wb_data;
  logic br_less, br_equal, rd_wren, br_un, lsu_wren, pc_sel, opa_sel, opb_sel;
  logic [1:0] wb_sel;
  logic [3:0] alu_op;
  //
  assign o_io_lcd = 32'b0;
  assign o_io_hex0 = 7'b0;
  assign o_io_hex1 = 7'b0;
  assign o_io_hex2 = 7'b0;
  assign o_io_hex3 = 7'b0;
  assign o_io_hex4 = 7'b0;
  assign o_io_hex5 = 7'b0;
  assign o_io_hex6 = 7'b0;
  assign o_io_hex7 = 7'b0;

pc_plus4 ipc (
        .i_pc(pc),
        .o_pc_plus4(pc_four)
    );

	pc1 pc2 (
	.i_clk (i_clk),
	.i_reset (~i_reset),
	.pc_sel(pc_sel),
	.i_alu_data (alu_data),
	.o_pc (pc),
        .pc_next (pc_next),
        .pc_cong4 (pc_four));				

	imem 	instmemory(					
	.i_addr(pc),					
	.o_rdata(instr));						
	 



regfile	register_file (			
		.i_clk(i_clk),
		.i_reset(~i_reset),
		.i_rs1_addr(instr[19:15]),
		.i_rs2_addr(instr[24:20]),
		.i_rd_addr(instr[11:7]), 
		.i_rd_data(wb_data),
		.i_rd_wren(rd_wren),
		.o_rs1_data(rs1_data),
		.o_rs2_data(rs2_data));
  
	immgen morongbit(
    .i_inst(instr),
    .o_imm(imm));
	 
control control1(
	.i_instr(instr),
	.i_br_less(br_less), 
	.i_br_equal(br_equal),
	.o_insn_vld(o_insn_vld),
	.o_rd_wren(rd_wren),
	.o_br_un(br_un), 
	.o_mem_wren(lsu_wren),
	.o_pc_sel(pc_sel), 
	.o_opa_sel(opa_sel), 
	.o_opb_sel(opb_sel), 
	.o_wb_sel(wb_sel),
	.o_alu_op(alu_op));
	 
	 BRC branch_compare(
	 .i_rs1_data(rs1_data),
	.i_rs2_data(rs2_data),
	.i_br_un(br_un),
	.o_br_less(br_less),
	.o_br_equal(br_equal));
	 
	assign operand_a = (opa_sel) ? pc : rs1_data;
	 assign operand_b = (opb_sel) ? imm : rs2_data;
  
				alu alu_unit(
				.i_op_a(operand_a), 
				.i_op_b(operand_b),
				.i_alu_op(alu_op),
				.o_alu_data(alu_data));

		lsu  lsu_unit(
		.i_clk(i_clk),
		.i_reset(~i_reset),
		.i_lsu_addr(alu_data),
		.i_st_data(rs2_data),
		.i_lsu_wren(lsu_wren),
		.i_io_sw(i_io_sw),
			.i_funct3(instr[14:12]),
			.o_ld_data(ld_data),
			.o_io_ledr(o_io_ledr),
			.o_io_ledg(o_io_ledg)
);

	
			
		mux4to1 mux4 (
		.a(ld_data),
		.b(alu_data),
		.c(pc_four),   
		.sel(wb_sel),
		.y(wb_data)
		);
	assign o_pc_debug= pc;
endmodule 
