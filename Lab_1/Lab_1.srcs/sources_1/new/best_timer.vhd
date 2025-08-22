----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.08.2025 10:08:42
-- Design Name: 
-- Module Name: best_timer - Behavioral
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
use ieee.std_logic_unsigned.all;

entity best_timer is
    Port ( clock : in STD_LOGIC;
           led0 : out STD_LOGIC;
           led1 : out STD_LOGIC;
           led2 : out STD_LOGIC;
           led3 : out STD_LOGIC);
end best_timer;

architecture Behavioral of best_timer is

signal timer :  std_logic_vector(27 downto 0);

begin
    process(clock) is
    begin
        if (clock'event and clock='1') then -- Equivalently you can write: if(rising_edge(clock))
        timer <= timer+1; 
    end if;

end process;

end Behavioral;
