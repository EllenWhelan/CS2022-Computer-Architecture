----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2018 03:36:00 PM
-- Design Name: 
-- Module Name: zero_detect_tb - Behavioral
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

entity zeroDetect_tb is
end zeroDetect_tb;

architecture Behavioral of zeroDetect_tb is

    COMPONENT zero_detect
    PORT (
        vector : in std_logic_vector(15 downto 0);
        Z : out std_logic
    );
    END COMPONENT;
    
    --sigansl
    signal vector : std_logic_vector(15 downto 0 );
    signal Z : std_logic;

begin

    uut: zero_detect PORT MAP (
        vector => vector,
        Z => Z
    );
    
    stim_proc: process
    begin

    vector <= "1111111111111111";
    wait for 5 ns;
    
      vector <= "1111000001111001";
    wait for 5 ns;
    
    vector <= "0000000000000000";
    wait for 5 ns;

    end process;

end Behavioral;
