module remainder (
    input signed [2:0] A,
    input signed [2:0] B,
    output [2:0] Result,
    output SF,
    output ZF,
    output DZF,
    output OF,
    output EF
);

    wire is_b_one;
    wire bit1_raw, bit0_raw;
    wire bit1, bit0;
    wire is_zero;

    assign is_b_one = (~B[2] & ~B[1] & B[0]);

    assign bit1_raw = (A[1] & B[1]) | (A[2] & ~B[0]); 
    assign bit0_raw = A[0];
    
    assign bit1 = bit1_raw & ~is_b_one;
    assign bit0 = bit0_raw & ~is_b_one;

    assign is_zero = ~(bit0 | bit1);

    assign Result[0] = bit0;
    assign Result[1] = bit1;
    assign Result[2] = is_zero ? 1'b0 : A[2];

    assign ZF = is_zero;
    assign DZF = ~(B[0] | B[1]);
    assign SF = is_zero ? 1'b0 : A[2];
    
    assign OF = bit0;
    assign EF = ~bit0;

endmodule