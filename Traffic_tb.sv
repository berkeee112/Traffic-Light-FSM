`timescale 1ns / 1ps

module Traffic_tb;

    logic clk;
    logic rst;
    logic TAORB;
    logic [5:0] led;

    Traffic uut (
        .clk(clk),
        .rst(rst),
        .TAORB(TAORB),
        .led(led)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("time=%0t | rst=%b | TAORB=%b | state=%b | timer=%0d | led=%b",
                 $time, rst, TAORB, uut.state_reg, uut.timer_reg, led);

        rst   = 1;
        TAORB = 1;

        #20;
        rst = 0;

        #20;
        TAORB = 0;

        #100;
        TAORB = 1;

        #100;

        #20;
        $stop;
    end

endmodule