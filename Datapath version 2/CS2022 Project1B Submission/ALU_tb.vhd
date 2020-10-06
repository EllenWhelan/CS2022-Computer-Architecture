----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 17:41:59
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is
COMPONENT ALU 
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           g_sel : in STD_LOGIC_VECTOR (3 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;
--signals 
signal A,B,G :std_logic_vector (15 downto 0) := (others=>'0');
signal g_sel: std_logic_vector (3 downto 0) := (others=>'0');
signal V,C :std_logic;

begin
    uut: ALU PORT MAP(
    A=>A,
    B=>B,
    C=>C,
    g_sel=>g_sel,
    G=>G,
    V=>V
    );
    stim_proc: process
    
    begin
    A<= "0000111100001111";
    B<= "1111000011110000";
    
    --0
    wait for 5ns;
    g_sel<="0000";
    --1
    wait for 5ns;
     g_sel<="0001";
     --2
    wait for 5ns;
     g_sel<="0010";
     --3
    wait for 5ns;
     g_sel<="0011";
     --4
    wait for 5ns;
     g_sel<="0100";
     --5
    wait for 5ns;
     g_sel<="0101";
     --6
    wait for 5ns;
     g_sel<="0110";
     --7
    wait for 5ns;
     g_sel<="0111";
     --8
    wait for 5ns;
     g_sel<="1000";
     --9
    wait for 5ns;
     g_sel<="1001";
     --10
    wait for 5ns;
     g_sel<="1010";
     --11
    wait for 5ns;
     g_sel<="1011";
     --12
    wait for 5ns;
     g_sel<="1100";
     --13
    wait for 5ns;
     g_sel<="1101";
     --14
    wait for 5ns;
     g_sel<="1110";
     --15
    wait for 5ns;
     g_sel<="1111";
         -- wait for 5ns;
    
end process;

end Behavioral;
