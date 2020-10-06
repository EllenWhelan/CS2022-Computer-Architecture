----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2019 15:56:46
-- Design Name: 
-- Module Name: decoder38_tb - Behavioral
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

entity decoder38_tb is
--  Port ( );
end decoder38_tb;

architecture Behavioral of decoder38_tb is


COMPONENT decoder3_8
PORT(
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
END COMPONENT;
--inputs
signal A0, A1, A2: std_logic;
--outputs
signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7: std_logic;

begin

    uut: decoder3_8 PORT MAP(
        A0=>A0,
        A1=>A1,
        A2=>A2,
        Q0=>Q0,
        Q1=>Q1,
        Q2=>Q2,
        Q3=>Q3,
        Q4=>Q4,
        Q5=>Q5,
        Q6=>Q6,
        Q7=>Q7
    );
    
    stim_proc: process
    begin
        A0<= '0';
        A1<='0';
        A2<='0';
        wait for 10 ns;
        
        A0<= '0';
        A1<='0';
        A2<='1';
        wait for 10 ns;
        
        A0<= '0';
        A1<='1';
        A2<='0';
        wait for 10 ns;
        
        A0<= '0';
        A1<='1';
        A2<='1';
        wait for 10 ns;
        
        A0<= '1';
        A1<='0';
        A2<='0';
        wait for 10 ns;
        
        A0<= '1';
        A1<='0';
        A2<='1';
        wait for 10 ns;
        
        A0<= '1';
        A1<='1';
        A2<='0';
        wait for 10 ns;
        
        A0<= '1';
        A1<='1';
        A2<='1';
        wait for 10 ns;
        
    
    end process;

end Behavioral;
