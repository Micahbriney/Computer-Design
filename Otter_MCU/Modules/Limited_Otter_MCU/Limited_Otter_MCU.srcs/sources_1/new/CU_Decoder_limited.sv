`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Ratner Surf Designs
// Engineer: James Ratner
// 
// Create Date: 01/29/2019 04:56:13 PM
// Design Name: 
// Module Name: CU_Decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies:
// 
// CU_DCDR my_cu_dcdr(
//   .br_eq     (), 
//   .br_lt     (), 
//   .br_ltu    (),
//   .opcode    (),    //-  ir[6:0]
//   .func7     (),    //-  ir[31:25]
//   .func3     (),    //-  ir[14:12] 
//   .alu_fun   (),
//   .pcSource  (),
//   .alu_srcA  (),
//   .alu_srcB  (), 
//   .rf_wr_sel ()   );
//
// 
// Revision:
// Revision 1.00 - File Created (02-01-2020) - from Paul, Joseph, & Celina
//          1.01 - (02-08-2020) - removed unneeded else's; fixed assignments
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module CU_DCDR(
    input br_eq, 
	input br_lt, 
	input br_ltu,
    input [6:0] opcode,             //-  ir[6:0]
    input [6:0] func7,              //-  ir[31:25]
    input [2:0] func3,              //-  ir[14:12] 
    output logic [3:0] alu_fun,
    output logic [1:0] pcSource,
    output logic alu_srcA,
    output logic [1:0] alu_srcB, 
	output logic [1:0] rf_wr_sel   );
    
    //- datatypes for RISC-V opcode types
    typedef enum logic [6:0] {
        LUI    = 7'b0110111,
        AUIPC  = 7'b0010111,
        JAL    = 7'b1101111,
        JALR   = 7'b1100111,
        BRANCH = 7'b1100011,
        LOAD   = 7'b0000011,
        STORE  = 7'b0100011,
        OP_IMM = 7'b0010011,
        OP_RG3 = 7'b0110011
    } opcode_t;
    opcode_t OPCODE; //- define variable of new opcode type
    
    assign OPCODE = opcode_t'(opcode); //- Cast input enum 

    //- datatype for func3Symbols tied to values
    typedef enum logic [2:0] {
        //BRANCH labels
        BEQ  = 3'b000,
        BNE  = 3'b001,
        BLT  = 3'b100,
        BGE  = 3'b101,
        BLTU = 3'b110,
        BGEU = 3'b111
    } func3_t;    
    func3_t FUNC3; //- define variable of new opcode type
    
    assign FUNC3 = func3_t'(func3); //- Cast input enum 
       
    always_comb
    begin 
        //- schedule all values to avoid latch
		alu_fun   <= 4'b0000;
		alu_srcA  <= 1'b0;
		alu_srcB  <= 2'b00;
		pcSource  <= 2'b00;
		rf_wr_sel <= 2'b00;
		
		case(OPCODE)
			LUI:
			begin
				alu_fun   <= 4'b1001; 
				alu_srcA  <= 1'b1;
				alu_srcB  <= 2'b01;
				rf_wr_sel <= 2'b11; 
			end
			
			JAL:
			begin
				pcSource  <= 2'b11; 
			end
			
			LOAD: 
			begin
				alu_srcB  <= 2'b01; 
				rf_wr_sel <= 2'b10;
			end
			
			STORE:
			begin
				alu_srcB  <= 2'b10;
			end
				
			OP_IMM:
			begin
				alu_srcB  <= 2'b01;
				rf_wr_sel <= 2'b11;
				alu_fun <= {1'b0, FUNC3};
			end
				
			default:
			begin
				alu_fun   <= 4'b0000;
				alu_srcA  <= 1'b0;
				alu_srcB  <= 2'b00;
				pcSource  <= 2'b00;
				rf_wr_sel <= 2'b00;
			end
		endcase
    end

endmodule