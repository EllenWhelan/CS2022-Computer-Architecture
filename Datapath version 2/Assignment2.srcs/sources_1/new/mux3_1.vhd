----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 18:09:10
-- Design Name: 
-- Module Name: mux3_1 - Behavioral
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

entity mux3_1 is
port(
B_curr, B_prev, B_next :in std_logic;
h_sel: in std_logic_vector (1 downto 0);
h: out std_logic
);
end mux3_1;

architecture Behavioral of mux3_1 is

begin
    h<= B_curr when h_sel<="00" else
    B_next when h_sel<="01" else
    B_prev when h_sel<="10";

end Behavioral;
