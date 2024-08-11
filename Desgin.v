module Synchronous_FIFO(data_out, FIFO_full, FIFO_empty, FIFO_counter, clk, rst, write_en, read_en, data_in);
  
  // INPUTS for the FIFO
  input clk, rst, write_en, read_en;
  input [7:0] data_in;
  
  // OUTPUTS for the FIFO
  output reg [7:0] data_out;
  output [6:0] FIFO_counter;
  
  // flags
  output reg FIFO_full, FIFO_empty;
  
  // MEMORY or DEPTH of the FIFO
  reg [7:0] memory [0:63];
  
  // POINTERS for write and read location
  reg [6:0] write_ptr, read_ptr;
  
  // COUNTER
  reg [6:0] counter;
  
  assign FIFO_counter = counter;
  
  always @(counter) // always block for updating flags
    begin
      FIFO_full = (counter == 64);
      FIFO_empty = (counter == 0);
    end
  
  always @(posedge clk or negedge rst) // always block for updating counter for count of number of filled locations
    begin
      if(!rst)
        counter <= 0;
      else if((write_en && !FIFO_full) && (read_en && !FIFO_empty))
        counter <= counter;
      else if(write_en && !FIFO_full)
        counter <= counter + 1;
      else if(read_en && !FIFO_empty)
        counter <= counter - 1;
    end
  
  always @(posedge clk) // always block for putting data into the FIFO
    begin
      if (write_en && !FIFO_full)
        memory[write_ptr] <= data_in;
    end

  always @(posedge clk) // always block for putting data into the FIFO
    begin
      if (read_en && !FIFO_empty) begin
        data_out <= memory[read_ptr];
        memory[read_ptr] <= 'bx;
      end
    end
  
  always @(posedge clk or negedge rst) // always block for ptr increaments
    begin
      if(!rst) begin
        write_ptr <= 0;
      	read_ptr <= 0;
      end
      
      else begin
        if (write_en && !FIFO_full)
        	write_ptr <= write_ptr + 1;
        
      	if (read_en && !FIFO_empty)
        	read_ptr <= read_ptr + 1;
      end
    end
  
//   always @(memory)
//     begin
//       for(integer i=0;i<64;i=i+1)
//         $display("memory[%0d] = %0d",i,memory[i]);
//       $display();
//     end
endmodule
