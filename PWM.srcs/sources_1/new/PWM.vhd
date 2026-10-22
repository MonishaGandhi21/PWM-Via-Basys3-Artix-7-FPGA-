----------------------------------------------------------------------------------
-- Company: The Maharaja Sayajirao University of Baroda
-- Engineer: Monisha Gandhi (BE Final year, Electronics, MS University)
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity PWM is
    Port ( clk : in STD_LOGIC;
           sig_in : in STD_LOGIC_VECTOR (7 downto 0);
           carrier : out STD_LOGIC_VECTOR (7 downto 0);
           pwm_sig_out : out std_logic);
end PWM;

architecture Behavioral of PWM is

signal sig_sig:unsigned(7 downto 0):= x"00";
signal pwm_sig:std_logic:= '0';
signal car_sig:unsigned(7 downto 0):= x"00";

begin
sig_sig <= unsigned  (sig_in);
carrier <= std_logic_vector (car_sig);

pwm_sig_out <= pwm_sig;
Process (clk) is
begin
if rising_edge (clk) then
    if  sig_sig > car_sig   then
        car_sig <= car_sig + 1;
    else
        car_sig <=(others => '0');
        pwm_sig <= NOT pwm_sig;
    end if;
end if;
end process;
--process (clk) is
--begin
--if rising_edge (clk)then
--     if car_sig >= 250-1 then
--            car_sig <=(others => '0');
--         else
--            car_sig <= car_sig + 1;
--         end if;
--end if;
--end  process ;
end Behavioral;      
