`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Micah Briney
// 
// Create Date: 02/03/2020 01:00:28 AM
// Design Name: 
// Module Name: Branch_Adder_Gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
//    Branch_Adder_Gen #(.n(32)) MY_BAG(
//        .pc     (),
//        .j_type (),
//        .b_type (),
//        .i_type (),
//        .rs1    (),
//        .jal    (),
//        .branch (),
//        .jalr   ()
//    );
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Branch_Adder_Gen(
    pc,
    j_type,
    b_type,
    i_type,
    rs1,
    jal,
    branch,
    jalr
    );
    
    parameter n = 32;
    
    input  [n-1:0] pc;
    input  [n-1:0] j_type;
    input  [n-1:0] b_type;
    input  [n-1:0] i_type;
    input  [n-1:0] rs1;
    output [n-1:0] jal;
    output [n-1:0] branch;
    output [n-1:0] jalr;
    
    assign jal    = {pc + 4 + j_type};
    assign jalr   = {pc + 4 + i_type};
    assign branch = {pc + b_type};
    
endmodule
