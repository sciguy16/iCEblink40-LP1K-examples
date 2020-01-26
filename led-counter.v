module led_counter(
	input CLK_3p33MHZ,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
);

	reg[21:0] counter;

	always @ (posedge CLK_3p33MHZ)
	begin
		counter = counter + 22'd1;
	end

	assign {LED1, LED2, LED3, LED4} = counter[21:18];
	endmodule

