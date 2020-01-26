module pwm (
	input CLK_3p33MHZ,
	output CLK_26kHz_out,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
);


	reg CLK_26kHz;
	reg[6:0] clk_div;

	reg[11:0] pwm_div;

	reg[4:0] pwm_counter; // 5-bit counter for 32-step pwm
	reg[4:0] pwm_ramp;
	reg led_out;

	always @ (posedge CLK_3p33MHZ)
	begin
		// Divide the 3.33 MHz clock by 128 to make a 26 kHz PWM clock
		clk_div = clk_div + 7'd1;
		CLK_26kHz = clk_div[6];
	end

	always @ (posedge CLK_26kHz) begin
		// for testing, make a 6 Hz led blinky signal
		pwm_div = pwm_div + 12'd1;
		pwm_counter = pwm_counter + 5'd1;

		// do the PWM
		if (pwm_counter < pwm_ramp) 
			led_out = 1;
		else
			led_out = 0;
	end

	// ramp up the pwm brightness at the rate of one tick per 6Hz clock
	always @ (posedge pwm_div[11]) begin
		pwm_ramp = pwm_ramp + 5'd1;
	end

	assign CLK_26kHz_out = CLK_26kHz;
	assign LED1 = pwm_div[11];
	assign LED2 = led_out;

	endmodule

