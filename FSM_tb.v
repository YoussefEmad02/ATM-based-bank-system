module FSM_tb ();
reg  X;
reg  Y;
reg  rst;
reg  clk;

wire unlock;


FSM DUT (
        .X(X),
        .Y(Y),
        .rst(rst),
        .clk(clk),
        .unlock(unlock)
    );

integer seed1=10;
integer seed2=20;
integer seed3=30;
integer i=0;


initial 
    begin
    clk = 0;
    forever begin
    #5;
    clk = ~clk;

    end
end
            

initial
    begin
    $dumpfile("FSM.vcd");
    $dumpvars ;

//initial values
X = 0;
Y = 0;
rst = 0;
clk = 1;


    #40;
#2  X = 1'b0;
#2  Y = 1'b1;
$monitor("monitor value =%b" , unlock);
$display("Test case 1"); 
#40;

#2  X = 1'b0;
#2  Y = 1'b1;
$display("Test case 2"); 
#40;

#2  X = 1'b0;
#2  Y = 1'b0;
$display("Test case 3"); 
#40;

#2  X = 1'b0;
#2  Y = 1'b0;
$display("Test case 4"); 
#40;

#2  X = 1'b1;
#2  Y = 1'b1;
$display("Test case 5"); 
#40;

#2  X = 1'b0;
#2  Y = 1'b0;
$display("Test case 6"); 
#40;


rst=0;
rst=1;
for(i=0;i<1000000;i=i+1)
begin
#40
#2  X = $random(seed3);
#2  Y = $random(seed3);
#40;

#2  X = $random(seed1);
#2  Y = $random(seed1);
#40;

#2  X = $random(seed2);
#2  Y = $random(seed2);
#40;

#2  X = $random(seed1);
#2  Y = $random(seed1);
#40;

#2  X = $random(seed1);
#2  Y = $random(seed1);
#40;

#2  X = $random(seed1);
#2  Y = $random(seed1);
#40;

end

rst = 0;
    #100;
    $finish();
    end



endmodule
