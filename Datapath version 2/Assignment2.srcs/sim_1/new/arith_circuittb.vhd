----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 16:38:40
-- Design Name: 
-- Module Name: arith_circuittb - Behavioral
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

entity arith_circuittb is
--  Port ( );
end arith_circuittb;

architecture Behavioral of arith_circuittb is
COMPONENT arithmetic_circuit  Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Cout : out STD_LOGIC;
           V : out std_logic;
           G : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

signal A,B,G : std_logic_vector (15 downto 0) := (others=>'0');
signal S0,S1,Cin,Cout,V :std_logic; 
 
begin
uut: arithmetic_circuit PORT MAP(
    A=>A,
    B=>B,
    Cin=>Cin,
    S0=>S0,
    S1=>S1,
    Cout=> Cout,
    G=>G,
    V=>V
    );
    stim_proc: process
    
    begin
    A<="1111000011110000";
    B<="0000000011111111";
    --0
    S0<='0';
    S1<='0';
    Cin<='0';
    --1
    wait for 5ns;
    S0<='0';
    S1<='0';
    Cin<='1';
    --2
    wait for 5ns;
    S0<='0';
    S1<='1';
    Cin<='0';
    --3
    wait for 5ns;
    S0<='0';
    S1<='1';
    Cin<='1';
    --4
    wait for 5ns;
    S0<='1';
    S1<='0';
    Cin<='0';
    --5
    wait for 5ns;
    S0<='1';
    S1<='0';
    Cin<='1';
    --6
    wait for 5ns;
    S0<='1';
    S1<='1';
    Cin<='0';
    --7
    wait for 5ns;
    S0<='1';
    S1<='1';
    Cin<='1';
    wait for 5ns;
    
    
    
    end process;

end Behavioral;
