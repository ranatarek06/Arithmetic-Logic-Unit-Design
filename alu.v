module alu (
    input  wire [2:0] A,
    input  wire [2:0] B,
    input  wire [1:0] S,
    output reg  [4:0] R,
    output reg        SF,
    output reg        ZF,
    output reg        DZF,
    output reg        EF,
    output reg        OF
);

    //Addition & Subtraction
    wire [3:0] as_R;
    wire       as_SF, as_ZF, as_EF, as_OF;
 
    //Multiplication
    wire [4:0] mul_R;
    wire       mul_SF, mul_ZF, mul_DZF, mul_EF, mul_OF;
 
    //Remainder
    wire [2:0] rem_R;
    wire       rem_SF, rem_ZF, rem_DZF, rem_OF, rem_EF;
    
    add_sub u_add_sub (
            .A  (A),
            .B  (B),
            .op (S[0]),
            .R  (as_R),
            .SF (as_SF),
            .ZF (as_ZF),
            .EF (as_EF),
            .OF (as_OF)
        );
    
        Multiplication u_mul (
            .A   (A),
            .B   (B),
            .R   (mul_R),
            .SF  (mul_SF),
            .ZF  (mul_ZF),
            .DZF (mul_DZF),
            .EF  (mul_EF),
            .OF  (mul_OF)
        );
    
        remainder u_rem (
            .A      (A),
            .B      (B),
            .Result (rem_R),
            .SF     (rem_SF),
            .ZF     (rem_ZF),
            .DZF    (rem_DZF),
            .OF     (rem_OF),
            .EF     (rem_EF)
        );
    
        always @(*) begin
            case (S)
    
                2'b00: begin
                    R   = {{1{as_R[3]}}, as_R};
                    SF  = as_SF;
                    ZF  = as_ZF;
                    DZF = 0;
                    EF  = as_EF;
                    OF  = as_OF;
                end
    
                2'b01: begin 
                    R   = {{1{as_R[3]}}, as_R};
                    SF  = as_SF;
                    ZF  = as_ZF;
                    DZF = 0;                 
                    EF  = as_EF;
                    OF  = as_OF;
                end
    
                2'b10: begin
                    R   = mul_R;
                    SF  = mul_SF;
                    ZF  = mul_ZF;
                    DZF = mul_DZF;
                    EF  = mul_EF;
                    OF  = mul_OF;
                end
    
                2'b11: begin
                    R   = {{2{rem_R[2]}}, rem_R};
                    SF  = rem_SF;
                    ZF  = rem_ZF;
                    DZF = rem_DZF;
                    EF  = rem_EF;
                    OF  = rem_OF;
                end
    
            endcase
        end
    
endmodule