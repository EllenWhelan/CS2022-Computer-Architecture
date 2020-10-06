----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2019 16:57:04
-- Design Name: 
-- Module Name: mux816_tb - Behavioral
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

entity mux816_tb is
--  Port ( );
end mux816_tb;

architecture Behavioral of mux816_tb is
COMPONENT mux8_16
    PORT(
           s0 : in STD_LOGIC;
           s1: in std_logic;
           s2: in std_logic;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           In2 : in STD_LOGIC_VECTOR (15 downto 0);
           In3 : in STD_LOGIC_VECTOR (15 downto 0);
           In4 : in STD_LOGIC_VECTOR (15 downto 0);
           In5 : in STD_LOGIC_VECTOR (15 downto 0);
           In6 : in STD_LOGIC_VECTOR (15 downto 0);
           In7 : in STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC_VECTOR (15 downto 0));
        
    END COMPONENT;
    

   --Inputs
   signal s0: STD_LOGIC;
   signal s1: std_logic;
   signal s2: std_logic;
   signal In0 : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
   signal In1 : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
   signal In2 : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
   signal In3 : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
   signal In4 : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
   signal In5 : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
   signal In6 : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
   signal In7 : STD_LOGIC_VECTOR (15 downto 0):= (others=>'0');
   
    --Outputs
   signal z : std_logic_vector(15 downto 0):=(others =>'0');
   
begin
uut: mux8_16 PORT MAP(
    s0=>s0,
    s1=>s1,
    s2=>s2,
    In0=> In0,
    In1=> In1,
    In2=> In2,
    In3=> In3,
    In4=> In4,
    In5=> In5,
    In6=> In6,
    In7=> In7,
    z=>z
    );
    
stim_proc:process
begin
    In0 <= "1010101010101010";
    In1 <= "1100110011001100";
    In2 <= "1111000011110000";
    In3 <= "1111111100000000";
    In4 <= "0101010101010101";
    In5 <= "0011001100110011";
    In6 <= "0000111100001111";
    In7 <= "0000000011111111";
    
    wait for 10ns;
    s0<='0';
    s1<='0';
    s2<='0';
    
    wait for 10ns;
    s0<='0';
    s1<='0';
    s2<='1';
    
    wait for 10ns;
    s0<='0';
    s1<='1';
    s2<='0';
    
    wait for 10ns;
    s0<='0';
    s1<='1';
    s2<='1';
    
    wait for 10ns;
    s0<='1';
    s1<='0';
    s2<='0';
    
    wait for 10ns;
    s0<='1';
    s1<='0';
    s2<='1';
    
    wait for 10ns;
    s0<='1';
    s1<='1';
    s2<='0';
    
    wait for 10ns;
    s0<='1';
    s1<='1';
    s2<='1';
    
    end process;
    
    


end Behavioral;
