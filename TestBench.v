`timescale 1ns / 1ps

module TestBench;
  // Inputs for CC
  reg [7:0] binary_input;
  wire [7:0] gray_output;

  // Inputs for CS
  reg start;
  reg convert;
  reg clk;
  wire R1_in, R2_in, R1_out, R2_out, R3_in, R3_out, R4_in, R4_out, done;

  // Instantiate the CC module
  CC cc (
    .R1(binary_input),
    .R2(gray_output)
  );

  // Instantiate the CS module
  CS cs (
    .start(start),
    .convert(convert),
    .clk(clk),
    .R1_in(R1_in),
    .R2_in(R2_in),
    .R1_out(R1_out),
    .R2_out(R2_out),
    .R3_in(R3_in),
    .R4_in(R4_in),
    .R3_out(R3_out),
    .R4_out(R4_out),
    .done(done)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Apply test vectors
  initial begin
    // Initialize inputs
    binary_input = 8'b11001010; // Example binary input
    start = 0;
    convert = 1;  // Binary to Gray code conversion

    // Wait for the clock to stabilize
    #10;

    // Start the conversion process
    start = 1;
    #10 start = 0;

    // Wait for the conversion to complete
    wait(done);
    #10;

    // Display the results
    $display("Binary Input: %b", binary_input);
    $display("Gray Output: %b", gray_output);

    // Finish the simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time: %0t | Binary Input: %b | Gray Output: %b | Done: %b",
             $time, binary_input, gray_output, done);
  end
endmodule
