----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2019 15:11:50
-- Design Name: 
-- Module Name: reg16_tb - Behavioral
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

entity reg16_tb is
--  Port ( );
end reg16_tb;

architecture Behavioral of reg16_tb is

COMPONENT reg16
PORT(
     D : in STD_LOGIC_VECTOR (15 downto 0);
     load : in STD_LOGIC;
     clk : in STD_LOGIC;
     Q : out STD_LOGIC_VECTOR (15 downto 0)
     );
END COMPONENT;

--INPUTS
signal D : std_logic_vector(15 downto 0) :=(others => '0');
signal load, clk : std_logic;

--outputs
signal Q : std_logic_vector(15 downto 0) ;


begin
    uut: reg16 PORT MAP(
        D=>D,
        load=>load,
        clk=>clk,
        Q=>Q
        );
    stim_proc: process
    begin
        D <="1111111111111111";
        load<='0';
        clk<='0';
        wait for 10 ns;
        clk<='1';
        
        wait for 10 ns;
        load<='1';
        clk<='0';
        
        wait for 10 ns;
        clk<='1';
        
        wait for 10 ns;
    
    end process;
    
end Behavioral;
