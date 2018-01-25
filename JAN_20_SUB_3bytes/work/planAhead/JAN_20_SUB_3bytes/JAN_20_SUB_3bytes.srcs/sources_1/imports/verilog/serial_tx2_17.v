module serial_tx2_17 #(
        parameter CLK_PER_BIT = 50
    )(
        // INPUT
        input clk,
        input rst,
        input block,
        input new_data,
        input [47:0] data,
        
        // OUTPUT
        output tx,
        output busy
    );

    // clog2 is 'ceiling of log base 2' which gives you the number of bits needed to store a value
    parameter CTR_SIZE = $clog2(CLK_PER_BIT);

    localparam STATE_SIZE = 2;
    localparam IDLE = 2'd0,
    START_BIT = 2'd1,
    DATA = 2'd2,
    STOP_BIT = 2'd3;

    reg [CTR_SIZE-1:0] ctr_d, ctr_q;
    reg [6:0] bit_ctr_d, bit_ctr_q;
    reg [47:0] data_d, data_q;
    reg [STATE_SIZE-1:0] state_d, state_q = IDLE;
    reg tx_d, tx_q;
    reg busy_d, busy_q;
    reg block_d, block_q;

    reg [2:0] Byte_countr_d,Byte_countr_q;

    assign tx = tx_q;
    assign busy = busy_q;

    always @(*) begin
        block_d = block;
        ctr_d = ctr_q;
        bit_ctr_d = bit_ctr_q;
        data_d = data_q;
        state_d = state_q;
        busy_d = busy_q;
        Byte_countr_d = Byte_countr_q;

        case (state_q)
            IDLE: begin
                if (block_q) begin
                    busy_d = 1'b1;
                    tx_d = 1'b1;
                end else begin
                    busy_d = 1'b0;
                    tx_d = 1'b1;
                    bit_ctr_d = 4'd0;
                    ctr_d = 1'b0;
                    Byte_countr_d=1'b0;
                    if (new_data) begin
                        data_d = data;
                        state_d = START_BIT;
                        busy_d = 1'b1;
                    end
                end
            end

            START_BIT: begin
                busy_d = 1'b1;
                ctr_d = ctr_q + 1'b1;
                tx_d = 1'b0;
                if (ctr_q == CLK_PER_BIT - 1) begin
                    ctr_d = 1'b0;
                    state_d = DATA;
                end
            end
            DATA: begin
                busy_d = 1'b1;
                tx_d = data_q[bit_ctr_q];
                ctr_d = ctr_q + 1'b1;
                if (ctr_q == CLK_PER_BIT - 1) begin
                    ctr_d = 1'b0;
                    bit_ctr_d = bit_ctr_q + 1'b1;
                    // for 8 bytes
                    if (bit_ctr_q == 7 || bit_ctr_q == 15 || bit_ctr_q == 23 || bit_ctr_q == 31||bit_ctr_q == 39|| bit_ctr_q == 47 ) begin//|| bit_ctr_q == 39 || bit_ctr_q == 47 || bit_ctr_q == 55 || bit_ctr_q == 63) begin//  change if increase package
                        state_d = STOP_BIT;
                    end
                end
            end
            STOP_BIT: begin
                busy_d = 1'b1;
                tx_d = 1'b1;
                ctr_d = ctr_q + 1'b1;
                if (ctr_q == CLK_PER_BIT - 1) begin
                    // 8 bytes -> 3'd7
                    if (Byte_countr_q == 3'd5) begin 
                        state_d = IDLE;
                    end else begin
                        // make delay to avoid error becuase of missmatch of speed
                        Byte_countr_d = Byte_countr_q +1'b1;
                        state_d = START_BIT;
                        ctr_d = 1'b0;
                    end               
                end


            end






            default: begin
                state_d = IDLE;
            end
        endcase
    end

    always @(posedge clk) begin
        if (rst) begin
            state_q <= IDLE;
            tx_q <= 1'b1;
        end else begin
            state_q <= state_d;
            tx_q <= tx_d;
        end

        Byte_countr_q <= Byte_countr_d;
        block_q <= block_d;
        data_q <= data_d;
        bit_ctr_q <= bit_ctr_d;
        ctr_q <= ctr_d;
        busy_q <= busy_d;
    end

endmodule