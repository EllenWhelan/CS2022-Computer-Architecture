----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2019 16:12:27
-- Design Name: 
-- Module Name: ripple16adder_tb - Behavioral
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

entity ripple16adder_tb is
--  Port ( );
end ripple16adder_tb;

architecture Behavioral of ripple16adder_tb is
COMPONENT ripple16_adder
     port(
        B,A: in std_logic_vector(15 downto 0);
        C0: in std_logic;
        S: out std_logic_vector(15 downto 0);
        C16: out std_logic;
        V :out std_logic
        );
END COMPONENT;

--input
signal B,A: std_logic_vector(15 downto 0):=(others => '0');
signal C0: std_logic;
--output
signal S: std_logic_vector (15 downto 0):=(others => '0');
signal C16, V: std_logic;
    
begin
    uut: ripple16_adder PORT MAP(
    A=>A,
    B=>B,
    C0=>C0,
    S=>S,
    C16=>C16,
    V=>V
    );
    stim_proc: process
    
    begin
    
     --show 2 zeroes work 
    A<="0000000000000000";
    B<="0000000000000000";
    C0<='0';
    wait for 5ns;
    C0<='1';
    wait for 5ns;
    
    --show it adds with both carry values
    A<="0000000000000001";
    B<="0000000000000001";
    C0<='0';
    wait for 5ns;
    C0<='1';
    wait for 5ns;
    
    --show c16 works
    A<="1111111111111111";
    B<="0000000000000001";
    C0<='0';
    wait for 5ns;
    C0<='1';
    wait for 5ns;
   
    
     --show carry not set if all 1s
    A<="1111111111111110";
    B<="0000000000000000";
    C0<='0';
    wait for 5ns;
    C0<='1';
    wait for 5ns;
    
     --show overflow
    A<="0111010000000000";
    B<="0100000000000000";
    C0<='0';
    wait for 5ns;
    C0<='1';
    wait for 5ns;
     
    end process;


end Behavioral;
