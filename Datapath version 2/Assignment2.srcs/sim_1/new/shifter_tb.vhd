----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 18:43:11
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shifter_tb is
--  Port ( );
end shifter_tb;

architecture Behavioral of shifter_tb is
COMPONENT shifter
  Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           h_sel : in STD_LOGIC_VECTOR (1 downto 0);
           Ir : in STD_LOGIC;
           Il : in STD_LOGIC;
           h : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;
--signals 
signal B,h : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
signal h_sel: std_logic_vector(1 downto 0 ):= (others =>'0');
signal Ir, Il: std_logic;

begin

    uut: shifter PORT MAP(
    B=>B,
    Ir=>Ir,
    h_sel=>h_sel,
    Il=>Il,
    h=>h
    );
    stim_proc: process
    
    begin
    B<="1100110011001100";
    Ir<='0';
    Il<='0';
    
    h_sel<="00";
    wait for 5ns;
    h_sel<="01";
    wait for 5ns;
    h_sel<="10";
    wait for 5ns;
    
    
end process;

end Behavioral;
