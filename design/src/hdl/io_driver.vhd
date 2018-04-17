library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity io_driver is
	port (
		-- inputs
		pwm0_in  : in  std_logic;
		pwm1_in  : in  std_logic;
		pwm2_in  : in  std_logic;

		-- outputs
		pwm0_out : out std_logic;
		pwm1_out : out std_logic;
		pwm2_out : out std_logic
	);
end io_driver;

architecture rtl of io_driver is

begin

	------------------------------------------------------------------------------------------------
	-- inverted PWM outputs
	pwm0_out <= not pwm0_in;
	pwm1_out <= not pwm1_in;
	pwm2_out <= not pwm2_in;

end rtl;
