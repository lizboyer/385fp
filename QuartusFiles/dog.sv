module  dog ( input Reset, frame_clk
);
   
   logic [9:0] Mouse_X_Pos, Mouse_X_Motion, Mouse_Y_Pos, Mouse_Y_Motion, Mouse_Size;
	 logic Aflag, Wflag, Sflag, Dflag;
	 
   parameter [9:0] Mouse_X_Center=320;  // Center position on the X axis
   parameter [9:0] Mouse_Y_Center=240;  // Center position on the Y axis
   parameter [9:0] Mouse_X_Min=0;       // Leftmost point on the X axis
   parameter [9:0] Mouse_X_Max=511;     // Rightmost point on the X axis
   parameter [9:0] Mouse_Y_Min=0;       // Topmost point on the Y axis
   parameter [9:0] Mouse_Y_Max=479;     // Bottommost point on the Y axis
   parameter [9:0] Mouse_X_Step=1;      // Step size on the X axis
   parameter [9:0] Mouse_Y_Step=1;      // Step size on the Y axis

   assign Mouse_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
  
   always_ff @ (posedge Reset or posedge frame_clk )
   begin: Move_Mouse
       if (Reset)  // Asynchronous Reset
       begin 
           Mouse_Y_Motion <= 10'd0; //Mouse_Y_Step;
				Mouse_X_Motion <= 10'd0; //Mouse_X_Step;
				Mouse_Y_Pos <= Mouse_Y_Center;
				Mouse_X_Pos <= Mouse_X_Center;
       end
          
       else 
       begin 
			//while Aflag
				 if ( (Mouse_Y_Pos + Mouse_Size) >= Mouse_Y_Max )  // Mouse is at the bottom edge, BOUNCE!
					if(~Sflag)
					  Mouse_Y_Motion <= (~ (Mouse_Y_Step) + 1'b1);  // 2's complement.
					else 
					  Mouse_Y_Motion <= 0;
					  
				 else if ( (Mouse_Y_Pos - Mouse_Size) <= Mouse_Y_Min )  // Mouse is at the top edge, BOUNCE!
				````//if Aflag <= 1
							//stop
					 //if else`
					if(~Wflag)
					  Mouse_Y_Motion <= Mouse_Y_Step;
					else 
					  Mouse_Y_Motion <= 0;
					  
					  
				  else if ( (Mouse_X_Pos + Mouse_Size) >= Mouse_X_Max )  // Mouse is at the Right edge, BOUNCE!
					  Mouse_X_Motion <= (~ (Mouse_X_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (Mouse_X_Pos - Mouse_Size) <= Mouse_X_Min )  // Mouse is at the Left edge, BOUNCE!
					  Mouse_X_Motion <= Mouse_X_Step;
					  
				 else 
					  Mouse_Y_Motion <= Mouse_Y_Motion;  // Mouse is somewhere in the middle, don't bounce, just keep moving
					  
				 
				 case (keycode)
					8'h04 : begin

								Mouse_X_Motion <= -1;//A
								Mouse_Y_Motion<= 0;
								Aflag <= 1;
								//WAS flags <= 0;
							  end
					        
					8'h07 : begin
								
					        Mouse_X_Motion <= 1;//D
							  Mouse_Y_Motion <= 0;
							  Dflag <= 1;
							  end

							  
					8'h16 : begin

					        Mouse_Y_Motion <= 1;//S
							  Mouse_X_Motion <= 0;
							  Sflag <= 1;
							 end
							  
					8'h1A : begin
					        Mouse_Y_Motion <= -1;//W
							  Mouse_X_Motion <= 0;
							  Wflag <= 1;
							 end	  
					default: 
						Wflag <= 0;
						Aflag <= 0;
						Sflag <= 0;
						Dflag <= 0;
			   endcase
				 
				 Mouse_Y_Pos <= (Mouse_Y_Pos + Mouse_Y_Motion);  // Update Mouse position
				 Mouse_X_Pos <= (Mouse_X_Pos + Mouse_X_Motion);
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
         Note that Mouse_Y_Motion in the above statement may have been changed at the same clock edge
         that is causing the assignment of Mouse_Y_pos.  Will the new value of Mouse_Y_Motion be used,
         or the old?  How will this impact behavior of the Mouse during a bounce, and how might that 
         interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
     **************************************************************************************/
     
			
		end  
   end
      
   assign MouseX = Mouse_X_Pos;
  
   assign MouseY = Mouse_Y_Pos;
  
   assign MouseS = Mouse_Size;
   

endmodule