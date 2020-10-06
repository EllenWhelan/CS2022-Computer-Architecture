----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 15:06:00
-- Design Name: 
-- Module Name: logiccircuit_tb - Behavioral
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

entity logiccircuit_tb is
--  Port ( );
end logiccircuit_tb;

architecture Behavioral of logiccircuit_tb is
COMPONENT logic_circuit Port (
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

    signal A,B,G: std_logic_vector (15 downto 0):= (others=>'0');
    signal S0,S1: std_logic;

begin
 uut: logic_circuit PORT MAP(
    A=>A,
    B=>B,
    S0=>S0,
    S1=>S1,
    G=>G
    );
    stim_proc: process
    begin
    A<= "1111000011111111";
    B<="1111111100000000";
    --and
    S0<='0';
    S1<='0';
    wait for 5ns;
    --or
     S0<='0';
    S1<='1';
    wait for 5ns;
    --xor
     S0<='1';
    S1<='0';
    wait for 5ns;
    --not a
     S0<='1';
    S1<='1';
    wait for 5ns;

end process;
end Behavioral;
