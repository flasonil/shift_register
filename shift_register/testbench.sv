`timescale 1ns/1ps


//SerInp=1 Shift a destra
//0
//1
//1
//0
//Reset
//ParInp=152;
//SerInp=1 Shift a sinistra
//1
//0
//NoShift
module testbench ();
  
   logic rstn;
   logic clk;
   logic [1:0] ctrl;
   
   logic [7:0] par_in;
   logic ser_in;
   logic [7:0] par_out;
   logic ser_out;
   
   shift_register DUT ( .clk(clk), .rstn(rstn), .ser_in(ser_in), .ser_out(ser_out), .par_in(par_in), .par_out(par_out), .ctrl(ctrl) );
   
   always
     begin 
        #5 clk = !clk;
     end
   
   initial
     begin
        clk = 0;
        rstn = 0;
        par_in = 0;
	ser_in = 1;
	ctrl = 0;
        
        #2 rstn = 1;
        
        @(negedge clk);

        ser_in = 1;
	ctrl = 2;
	par_in = 0;
        
        @(negedge clk);
        
        ser_in = 0;
        
        @(negedge clk);  

	ser_in = 1;

	@(negedge clk);

	ser_in = 1;

	@(negedge clk);
	
	ser_in = 0;

	@(negedge clk);

	rstn = 0;

	@(negedge clk);

	rstn = 1;
	ctrl = 3;
	par_in = 152;

	@(negedge clk);

	ctrl = 1;
	ser_in = 1;

	@(negedge clk);

	ctrl = 1;
	ser_in = 1;

	@(negedge clk);

	ctrl = 1;
	ser_in = 0;

	@(negedge clk);

	ctrl = 0;

	@(negedge clk);

	ctrl = 2;

	@(negedge clk);   
        $stop;
     end
   
endmodule


