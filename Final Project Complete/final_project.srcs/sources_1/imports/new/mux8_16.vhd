----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2019 16:49:05
-- Design Name: 
-- Module Name: mux8_16 - Behavioral
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

entity mux8_16 is
    Port ( s0 : in STD_LOGIC;
           s1: in std_logic;
           s2: in std_logic;
           s3: in std_logic;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           In2 : in STD_LOGIC_VECTOR (15 downto 0);
           In3 : in STD_LOGIC_VECTOR (15 downto 0);
           In4 : in STD_LOGIC_VECTOR (15 downto 0);
           In5 : in STD_LOGIC_VECTOR (15 downto 0);
           In6 : in STD_LOGIC_VECTOR (15 downto 0);
           In7 : in STD_LOGIC_VECTOR (15 downto 0);
           In8 : in std_logic_vector (15 downto 0);
           z : out STD_LOGIC_VECTOR (15 downto 0));
end mux8_16;

architecture Behavioral of mux8_16 is

begin
    Z<=In0 after 5ns when s0='0' and s1='0' and s2='0' and s3='0' else --0000
       In1  after 5ns when s0='0' and s1='0' and s2='0' and s3='1' else --0001
       In2  after 5ns when s0='0' and s1='0' and s2='1' and s3='0' else --0010
       In3  after 5ns when s0='0' and s1='0' and s2='1' and s3='1' else --0011
       In4  after 5ns when s0='0' and s1='1' and s2='0' and s3='0' else --0100
       In5  after 5ns when s0='0' and s1='1' and s2='0' and s3='1' else --0101
       In6  after 5ns when s0='0' and s1='1' and s2='1' and s3='0' else --0110
       In7  after 5ns when s0='0' and s1='1' and s2='1' and s3='1' else --0111
       In8 after 5ns when s0='1' and s1='0' and s2='0' and s3='0' else  --1000
       "0000000000000000" after 5ns;
       


end Behavioral;
