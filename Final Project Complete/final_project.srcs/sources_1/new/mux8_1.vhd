----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.04.2019 11:34:35
-- Design Name: 
-- Module Name: mux8_1 - Behavioral
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

entity mux8_1 is
    Port(
        N: in std_logic;
        Z: in std_logic;
        V: in std_logic;
        C: in std_logic;
        not_Z: in std_logic;
        not_C: in std_logic;
        zero: in std_logic;
        one: in std_logic;
        MS: in std_logic_vector(2 downto 0);
        muxS_out: out std_logic
    );
end mux8_1;

architecture Behavioral of mux8_1 is

begin

muxS_out<=zero when MS<="000" else
        one when MS <="001" else
        C when MS <="010" else
        V when MS<="011" else
        Z when MS<="100" else 
        N when MS<="101" else
        not_C when MS <="110" else
        not_Z when MS <="111" ;

end Behavioral;
