----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 16:04:49
-- Design Name: 
-- Module Name: Binputlogic_tb - Behavioral
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

entity Binputlogic_tb is
   
end Binputlogic_tb;

architecture Behavioral of Binputlogic_tb is
COMPONENT B_input_logic  Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

signal B, Y: std_logic_vector(15 downto 0) := (others=>'0');
signal S0,S1 : std_logic;

begin
uut: B_input_logic PORT MAP(
    Y=>Y,
    B=>B,
    S0=>S0,
    S1=>S1
  
    );
    stim_proc: process
    begin
    B<= "1111000011110000";
    S0<='0';
    S1<='0';
    wait for 5ns;
    S0<='0';
    S1<='1';
    wait for 5ns;
    S0<='1';
    S1<='0';
    wait for 5ns;
    S0<='1';
    S1<='1';
    wait for 5ns;
    
end process;
end Behavioral;
