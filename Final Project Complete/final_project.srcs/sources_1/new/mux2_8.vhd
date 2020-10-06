----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2018 01:12:42 PM
-- Design Name: 
-- Module Name: mux2_8bit - Behavioral
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

entity mux2_8bit is
    Port (
        in0, in1 : in std_logic_vector(7 downto 0);
        s : in std_logic;
        Z : out std_logic_vector(7 downto 0)
    );
end mux2_8bit;

architecture Behavioral of mux2_8bit is

begin

Z <= in0 after 5 ns when s = '0' else
    in1 after 5 ns when s = '1' else
    "00000000";


end Behavioral;
