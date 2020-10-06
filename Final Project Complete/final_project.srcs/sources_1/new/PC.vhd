----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2018 01:04:17 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is
    Port (
        reset : in std_logic;
        clk : in std_logic;
        load_adr : in std_logic_vector(15 downto 0);
        PL, PI : in std_logic;
        PC_out : inout std_logic_vector(15 downto 0)
    );
end PC;

architecture Behavioral of PC is

begin


process(clk)

begin
    if reset = '1' then
        PC_out <= "0000000000000000";
    else
        if(rising_edge(Clk)) then
            if PL = '1' then
                PC_out <= load_adr;
            else
                if PI = '1' then
                    PC_out <= PC_out + 1 after 5 ns;
                end if;
            end if;
        end if;
    end if;
end process;


end Behavioral;
