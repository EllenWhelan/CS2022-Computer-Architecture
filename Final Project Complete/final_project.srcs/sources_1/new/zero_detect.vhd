----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2018 03:23:17 PM
-- Design Name: 
-- Module Name: zero_detect - Behavioral
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

entity zero_detect is
    Port (
        vector : in std_logic_vector(15 downto 0);
        Z : out std_logic
    );
end zero_detect;

architecture Behavioral of zero_detect is

    signal notZ : std_logic;

begin

    notZ <= vector(0) or vector(1) or vector(2) or vector(3) or vector(4) or vector(5)
        or vector(6) or vector(7) or vector(8) or vector(9) or vector(10)
        or vector(11) or vector(12) or vector(13) or vector(14) or vector(15)
        after 1 ns;
        
    Z <= not notZ after 1 ns;


end Behavioral;
