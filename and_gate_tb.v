module and_gate_tb ();
reg  in1;
reg  in2;

wire  out;


and_gate DUT (
        .in1(in1),
        .in2(in2),
        .out(out)
    );

integer seed1=10;
integer seed2=20;
integer seed3=30;
integer i=0;



initial
    begin
    $dumpfile("and_gate.vcd");
    $dumpvars ;

//initial values
in1 = 0;
in2 = 0;


    #40;
#2  in1 = 1'b1;
#2  in2 = 1'b0;
$monitor("monitor value =%b" , out);
$display("Test case 1"); 
#40;

#2  in1 = 1'b0;
#2  in2 = 1'b0;
$display("Test case 2"); 
#40;

#2  in1 = 1'b1;
#2  in2 = 1'b0;
$display("Test case 3"); 
#40;

#2  in1 = 1'b0;
#2  in2 = 1'b1;
$display("Test case 4"); 
#40;

#2  in1 = 1'b1;
#2  in2 = 1'b1;
$display("Test case 5"); 
#40;

#2  in1 = 1'b0;
#2  in2 = 1'b0;
$display("Test case 6"); 
#40;


for(i=0;i<1000000;i=i+1)
begin
#40
#2  in1 = $random(seed3);
#2  in2 = $random(seed3);
#40;

#2  in1 = $random(seed3);
#2  in2 = $random(seed3);
#40;

#2  in1 = $random(seed2);
#2  in2 = $random(seed2);
#40;

#2  in1 = $random(seed1);
#2  in2 = $random(seed1);
#40;

#2  in1 = $random(seed3);
#2  in2 = $random(seed3);
#40;

#2  in1 = $random(seed1);
#2  in2 = $random(seed1);
#40;

end


    #100;
    $finish();
    end



endmodule
