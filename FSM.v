
module FSM (
input  wire        X, 
input  wire        Y,
input  wire        rst,
input  wire        clk,
output reg         unlock
);



localparam  [2:0]    IDLE = 3'b000,
                     state_1 = 3'b001,
                     state_2 = 3'b011,
					 state_3 = 3'b010,
					 state_4 = 3'b110,
					 Exit = 3'b111 ;
					 
reg    [2:0]         current_state,
                     next_state ;
		
// state transition 		
always @(posedge clk or negedge rst)
 begin
  if(!rst)
   begin
     current_state <= IDLE ;
   end
  else
   begin
     current_state <= next_state ;
   end
 end
 
// next_state logic
always @(*)
 begin
  case(current_state)
  IDLE     : begin
              if(X)
			   next_state = IDLE ;
			  else if (Y)
               next_state = state_1 ;
              else
               next_state = IDLE ;			  
             end
  state_1       : begin
              if(X)
			   next_state = IDLE ;
			  else if (Y)
               next_state = state_2 ;
              else
               next_state = state_1 ;	   
            end
  state_2     : begin
              if(X)
			   next_state = state_3 ;
			  else if (Y)
               next_state = IDLE ;
              else
               next_state = state_2 ;	    
            end
  state_3    : begin
              if(X)
			   next_state = IDLE ;
			  else if (Y)
               next_state = state_4 ;
              else
               next_state = state_3 ;	    
            end
  state_4   : begin
             if(X)
			   next_state = Exit ;
		     else if (Y)
               next_state = IDLE ;
             else
               next_state = state_4 ;	   
            end			 
  Exit  : begin
               next_state = IDLE ;
            end	
  default :   next_state = IDLE ;		 
  
  endcase
end	


// next_state logic
always @(*)
 begin
  case(current_state)
  IDLE     : begin
              unlock   =  1'b0 ;		  
             end
  state_1       : begin
              unlock   =  1'b0 ;
             end	
  state_2      : begin
              unlock   =  1'b0 ;	   
             end
  state_3     : begin
              unlock   =  1'b0 ;	   
             end
  state_4    : begin
              unlock   =  1'b0 ;		   
             end			 
  Exit   : begin
              unlock   =  1'b1 ;	
             end	
  default  : begin
              unlock   =  1'b0 ;
             end			  
  endcase
 end	
		
		
endmodule					 