module dec7seg (
    input  [3:0] x,
    output [6:0] s 
);
    wire A = x[3];
    wire B = x[2];
    wire C = x[1];
    wire D = x[0];

    assign s[0] = (~A & ~B & ~D) | (~A & C) | (B & C) | (A & ~D) | (~A & B & D) 
    | (A & ~B & ~C);
    assign s[1] = (~A & ~B) | (~A & ~C & ~D) | (~A & C & D) | (A & ~B & ~C) 
    | (A & ~B & ~D) | (A & B & ~C & D);
    assign s[2] = (~A & B) | (A & ~B) | (~A & ~C) | (~A & D) | (~C & D);
    assign s[3] = (~A & ~B & ~D) | (~A & ~B & C) | (~A & B & ~C & D) | (B & C & ~D) 
    | (A & ~B & ~C) | (A & ~B & D) | (A & B & ~C);
    assign s[4] = (A & B) | (A & C) | (~B & ~D) | (C & ~D);
    assign s[5] = (A & ~B) | (~A & B & ~C) | (B & ~D) | (A & C) | (~C & ~D);
    assign s[6] = (~A & ~B & C) | (~A & B & ~C) | (A & ~B) | (A & D) | (A & C) 
    | (B & C & ~D);

endmodule

module convBin2Hex (
    input  [7:0] sw,
    output [6:0] seg0,
    output [6:0] seg1
);

    dec7seg display_direita (
        .x(sw[3:0]), 
        .s(seg0)
    );

    dec7seg display_esquerda (
        .x(sw[7:4]), 
        .s(seg1)
    );

endmodule