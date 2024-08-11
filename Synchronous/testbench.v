module tb;
    // INPUTS for the FIFO
  reg clk, rst, write_en, read_en;
  reg [7:0] data_in;
  
  // OUTPUTS for the FIFO
  wire [7:0] data_out;
  wire [6:0] FIFO_counter;
  
  // flags
  wire FIFO_full, FIFO_empty;
  
  Synchronous_FIFO dut(data_out, FIFO_full, FIFO_empty, FIFO_counter, clk, rst, write_en, read_en, data_in);
  
  initial begin
    clk=1;
    rst=0;
    #6 rst=1;
    
	data_in = 0;
    #10;
    data_in = 1;
    #10;
    data_in = 2;
    #10;
    data_in = 3;
    #10;
    data_in = 4;
    #10;
    data_in = 5;
    #10;
    data_in = 6;
    #10;
    data_in = 7;
    #10;
    data_in = 8;
    #10;
    data_in = 9;
    #10;
	data_in = 0;
    #10;
    data_in = 1;
    #10;
    data_in = 2;
    #10;
    data_in = 3;
    #10;
    data_in = 4;
    #10;
    data_in = 5;
    #10;
    data_in = 6;
    #10;
    data_in = 7;
    #10;
    data_in = 8;
    #10;
    data_in = 9;
    #10;
	data_in = 0;
    #10;
    data_in = 1;
    #10;
    data_in = 2;
    #10;
    data_in = 3;
    #10;
    data_in = 4;
    #10;
    data_in = 5;
    #10;
    data_in = 6;
    #10;
    data_in = 7;
    #10;
    data_in = 8;
    #10;
    data_in = 9;
    #10;
	data_in = 0;
    #10;
    data_in = 1;
    #10;
    data_in = 2;
    #10;
    data_in = 3;
    #10;
    data_in = 4;
    #10;
    data_in = 5;
    #10;
    data_in = 6;
    #10;
    data_in = 7;
    #10;
    data_in = 8;
    #10;
    data_in = 9;
    #10;
	data_in = 0;
    #10;
    data_in = 1;
    #10;
    data_in = 2;
    #10;
    data_in = 3;
    #10;
    data_in = 4;
    #10;
    data_in = 5;
    #10;
    data_in = 6;
    #10;
    data_in = 7;
    #10;
    data_in = 8;
    #10;
    data_in = 9;
    #10;
	data_in = 0;
    #10;
    data_in = 1;
    #10;
    data_in = 2;
    #10;
    data_in = 3;
    #10;
    data_in = 4;
    #10;
    data_in = 5;
    #10;
    data_in = 6;
    #10;
    data_in = 7;
    #10;
    data_in = 8;
    #10;
    data_in = 9;
    #10;
	data_in = 0;
    #10;
    data_in = 1;
    #10;
    data_in = 2;
    #10;
    data_in = 3;
    #700;
	$finish;
  end
  
	initial begin
      // for checking write operations and fifo_full case 
      write_en = 1;
      read_en = 0;
      #670;
      // for checking read operations and empty case 
      write_en = 0;
      read_en = 1;
      
    end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,data_out, FIFO_full, FIFO_empty, FIFO_counter, clk, rst, write_en, read_en, data_in);
  end
  
endmodule
