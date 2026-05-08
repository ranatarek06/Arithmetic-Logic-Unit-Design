module remainder_testbench;

    reg signed [2:0] A;
    reg signed [2:0] B;
    wire [2:0] Result;
    wire SF, ZF, DZF, OF, EF;

    remainder TESTING (
        .A(A),
        .B(B),
        .Result(Result),
        .SF(SF),
        .ZF(ZF),
        .DZF(DZF),
        .OF(OF),
        .EF(EF)
    );

    integer i, j, file;

    initial begin
        file = $fopen("remainder.txt", "w");

        $fdisplay(file, " A  |  B  | Res | Flags (SZDOE)");
        $fdisplay(file, "----|-----|-----|--------------");

        for (i = -3; i <= 3; i = i + 1) begin
            for (j = -3; j <= 3; j = j + 1) begin
                A = i;
                B = j;
                #10;
                $fdisplay(file, "%d | %d | %d | %b%b%b%b%b",
                          A, B, $signed(Result), SF, ZF, DZF, OF, EF);
            end
        end

        $fdisplay(file, "-------------------------------");
        $fdisplay(file, "Simulation Complete.");
        $fclose(file);
        $finish;
    end

endmodule