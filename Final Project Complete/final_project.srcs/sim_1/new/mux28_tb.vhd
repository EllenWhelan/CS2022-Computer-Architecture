----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2018 01:15:23 PM
-- Design Name: 
-- Module Name: mux2_8bit_tb - Behavioral
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

entity mux2_8bit_tb is
end mux2_8bit_tb;

architecture Behavioral of mux2_8bit_tb is

    COMPONENT mux2_8bit PORT (
        in0, in1 : in std_Logic_vector(7 downto 0);
        s : in std_logic;
        Z : out std_logic_vector(7 downto 0)
    );
    END COMPONENT;
    
    -- inputs
    signal in0, in1 : std_logic_vector(7 downto 0);
    signal s : std_logic;
    
    -- outputs
    signal Z : std_logic_vector(7 downto 0);

begin

    uut : mux2_8bit PORT MAP (
        in0 => in0,
        in1 => in1,
        s => s,
        Z => Z
    );
    
    stim_proc : process
    begin

    in0 <= X"AA";
    in1 <= X"BB";
    s <= '0';
    wait for 5 ns;
    
    s <= '1';
    wait for 5 ns;

    end process;

end Behavioral;
