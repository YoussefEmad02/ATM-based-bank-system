module shifter_tb ();
reg clk;
reg load;
reg right;
reg left;
reg [4:0] in_value;

wire [4:0] value;


shifter DUT (
        .clk(clk),
        .load(load),
        .right(right),
        .left(left),
        .in_value(in_value),
        .value(value)
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
    $dumpfile("shifter.vcd");
    $dumpvars ;

//initial values
clk = 1;
load = 0;
right = 0;
left = 0;
in_value = 0;


    #40;
#2 load = 1'b0;
#2 right = 1'b0;
#2 left = 1'b1;
#2 in_value = 5'b0000;
$monitor("monitor value =%b" , value);
$display("Test case 1"); 
#40;

#2 load = 1'b0;
#2 right = 1'b0;
#2 left = 1'b1;
#2 in_value = 5'b0000;
$display("Test case 2"); 
#40;

#2 load = 1'b0;
#2 right = 1'b1;
#2 left = 1'b1;
#2 in_value = 5'b1001;
$display("Test case 3"); 
#40;

#2 load = 1'b0;
#2 right = 1'b1;
#2 left = 1'b0;
#2 in_value = 5'b1111;
$display("Test case 4"); 
#40;

#2 load = 1'b0;
#2 right = 1'b1;
#2 left = 1'b1;
#2 in_value = 5'b0110;
$display("Test case 5"); 
#40;

#2 load = 1'b0;
#2 right = 1'b0;
#2 left = 1'b0;
#2 in_value = 5'b0010;
$display("Test case 6"); 
#40;


for(i=0;i<1000000;i=i+1)
begin
#40
#2 load = $random(seed1);
#2 right = $random(seed1);
#2 left = $random(seed1);
#2 in_value = $random(seed1);
#40;

#2 load = $random(seed2);
#2 right = $random(seed2);
#2 left = $random(seed2);
#2 in_value = $random(seed2);
#40;

#2 load = $random(seed1);
#2 right = $random(seed1);
#2 left = $random(seed1);
#2 in_value = $random(seed1);
#40;

#2 load = $random(seed2);
#2 right = $random(seed2);
#2 left = $random(seed2);
#2 in_value = $random(seed2);
#40;

#2 load = $random(seed3);
#2 right = $random(seed3);
#2 left = $random(seed3);
#2 in_value = $random(seed3);
#40;

#2 load = $random(seed3);
#2 right = $random(seed3);
#2 left = $random(seed3);
#2 in_value = $random(seed3);
#40;

end


    #100;
    $finish();
    end



endmodule
