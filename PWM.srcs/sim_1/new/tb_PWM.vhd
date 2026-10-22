----------------------------------------------------------------------------------
-- Company: The Maharaja Sayajirao University of Baroda
-- Engineer: Monisha Gandhi (BE Final year, Electronics, MS University
--           Modifications suggested by: Shyama Gandhi (Edmonton, Alberta)
-- 
-- Create Date: 20/10/2023
-- Design Name: PWM generator
-- Module Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;--code  for test bench
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_PWM is
end tb_PWM;

architecture Behavioral of tb_PWM is

signal sig_sig:STD_LOGIC_VECTOR (7 downto 0):="00000000";
signal car_sig:STD_LOGIC_VECTOR (7 downto 0):="00000000";
constant clock_period : time := 100 ns ; --10MHz

-----------
-- declaring a missing clk signal 
signal Clk_tb : std_logic;
--signal pwm_sig : std_logic;
signal pwm_out_tb : std_logic;
-----------
begin

    test_pwm: entity WORK.PWM(Behavioral) 
                  port map ( clk => Clk_tb,
                   sig_in=> sig_sig,
                   carrier=>car_sig,
                   pwm_sig_out => pwm_out_tb);
                  
sig_sig_process:process
begin

sig_sig <= "00001111" ; --5.85% duty cycle--passing a vector and not a bit
wait for 2250 ns;

sig_sig<="00110111";--21.48% duty cycle
wait for 2250 ns;

sig_sig <= "10111100" ; --33.5% duty cycle--passing a vector and not a bit
wait for 2250 ns;

sig_sig <= "01011010" ; --66.40% duty cycle--passing a vector and not a bit
wait for 2250 ns;

sig_sig<="11001101";--80% duty cycle
wait for 2250 ns;

sig_sig <= "11110000" ; --93.75% duty cycle--passing a vector and not a bit
wait for 2250 ns;

sig_sig<="11111111";--99.6% duty cycle
wait for 2250 ns;



end process;

Stimulus_process1: process 
Begin
Clk_tb<= '0' ; 
wait for 20 ns;
Clk_tb<= '1' ; 
wait for 20 ns ;

end process;
end Behavioral;
