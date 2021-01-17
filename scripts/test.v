/*************************************************************************
    > File Name: test.v
    > Author: WeiLi
    > Mail: lweifdu@gmail.com
    > Created Time: Mon Nov  2 10:59:46 2020
    > Description: format verilog source code
 ************************************************************************/

 module test(
    in1_i ,
    in2_i ,
    in3_i ,
    out1_o ,

    // maybe here are some comments
    in4_i ,
    in5_i ,
    out2_o ,

    // or we have multi line
    // comments, and use {{{ }}} to group them
    // {{{
    in6_i ,
    in7_i ,
    out3_o ,
    out4_o ,
    out_complex_5_o
    // }}}
 );

//*** PARAMETER *****
parameter A_RANDOM_PARAM = 5'd10;
parameter CASUAL_PARAM_HERE = 3'd6;
    parameter KIDDING = 'd0;

localparam ST_IDLE = 3'd0; // some comments maybe at end of a line
// maybe some lines have space left end of them
localparam ST_START = 3'd1;    
localparam DATA_WD = 4'd10;

//*** I/O ***
input in1_i;
input [A_RANDOM_PARAM -1:0] in2_i;
input [CASUAL_PARAM_HERE -1:0] in3_i;
output reg [KIDDING -1:0] out1_o;
output [DATA_WD*KIDDING -1:0] out_complex_5_o;

//*** REG/WIRE *****
wire a_wire_var;
wire [ST_IDLE -1:0] a_wire_var;
reg [DATA_WD -1:0] a_reg_var;

// maybe here are some comments
// {{{
wire [ST_IDLE -1:0] a_wire_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var;
reg [DATA_WD -1:0] a_reg_var; // some comments after a line
// }}}

//*** MAIN BODY ****
// some useless logic
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        a_reg_var <= 5'd0;
    end
    else if(a_reg_var && a_reg_var) begin
        a_reg_var <= a_reg_var[DATA_WD -1: 1];
    end
end

always @(*) begin
    a_reg_var = 5'd0;
    if(a_reg_var && a_reg_var) begin
        a_reg_var = a_reg_var[DATA_WD -1: 1];
    end
end

// you may instance some module
one_sub_module #(
    .PARAM ( PARAM ),
    .PARAM_COMPLEX ( PARAM_COMPLEX ),
    .SOME_PARAM ( SOME_PARAM ),
    .LARGE_PARAM ( LARGE_PARAM ),
    .END_PARAM ( END_PARAM )
)u_one_sub_module(
    .clk ( clk ),
    .in1_i ( a_wire_var ),
    .in2_i ( a_reg_var  ),
    .in3_i ( a_ver_long_and_complex_var  ),
    .out1_o ( a_wire_var  ),

    // maybe here are some comments
    .in4_i ( a_wir_var  ),
    .in5_i ( a_qire_var  ),
    .out2_o ( a_wire_var  ),

    // or we have multi line
    // comments, and use {{{ }}} to group them
    // {{{
    .in6_i ( a_wire_var  ),
    .in7_i ( a_wire_var  ),
    .out3_o ( a_high_var  ),
    .out4_o ( a_low_var  ),
    .out_complex_5_o ( a_novel_var )
);
 

// some module may have no parameters
one_sub_module u_one_sub_module(
    .clk ( clk ),
    .in1_i ( a_wire_var ),
    .in2_i ( a_reg_var  ),
    .in3_i ( a_var  ),
    .out1_o ( a_wire_var  ),

    // maybe here are some comments
    .in4_i ( a_wir_var  ),
    .in5_i ( a_qire_var  ),
    .out2_o ( a_wire_var  ), // add some comments end of a signal

    // or we have multi line
    // comments, and use {{{ }}} to group them
    // {{{
    .in6_i ( a_wire_var  ),
    .in7_i ( a_wire_var  ),
    .out3_o ( a_high_var  ),
    .out4_o ( a_low_var  ),
    .out_complex_5_o ( a_novel_var )
);

assign some_vars = to_another_vars;

// or use generate
generate
    for(i = 0; i < A_PAR; i = i + 1) begin: a_loop
        thereis some logic
        here
        "or"
        instance_of_module
    end
endgenerate
        

//*** DEBUG ****
    `ifdef DBUG
    `endif

endmodule

