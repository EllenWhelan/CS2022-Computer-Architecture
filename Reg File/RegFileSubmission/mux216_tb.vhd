----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2019 16:27:05
-- Design Name: 
-- Module Name: mux216_tb - Behavioral
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

entity mux216_tb is
--  Port ( );
end mux216_tb;

architecture Behavioral of mux216_tb is

    COMPONENT mux2_16
    PORT(
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
   END COMPONENT;
   
   --inputs
   signal In0: std_logic_vector(15 downto 0) :=(others =>'0');
   signal In1: std_logic_vector(15 downto 0) :=(others =>'0');
   signal s: std_logic;
   --ouputs
   signal z:std_logic_vector(15 downto 0) :=(others =>'0');
   
    

begin
    uut: mux2_16 PORT MAP(
        In0=> In0,
        In1=>In1,
        s=>s,
        z=>z
    );
    
stim_proc: process
begin
        In0 <= "1010101010101010";
		In1 <= "1100110011001100";
		
		wait for 10 ns;
		s<='0';
		wait for 10 ns;
		s<='1';
    end process;

end Behavioral;
