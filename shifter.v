module shifter (

	input					clk,
	input					load,
	input					right,
	input					left,
	input			[4:0]	in_value,
	output	reg		[4:0]	value 
	
);

reg [4:0] internal_reg ;

always @ (posedge clk)
 begin
	 if (load)
	  begin
		 internal_reg <= in_value ;
	  end
	 else if (right)
	  begin
		 internal_reg <= internal_reg >> 1 ;
		 value <= internal_reg ;
	  end
	 else if (left)
	  begin
		 internal_reg <= internal_reg << 1 ;
         value <= internal_reg ;
	  end	  
 
 end
 
 
endmodule