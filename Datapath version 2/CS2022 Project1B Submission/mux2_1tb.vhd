----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 15:40:55
-- Design Name: 
-- Module Name: mux2_1tb - Behavioral
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

entity mux2_1tb is
--  Port ( );
end mux2_1tb;

architecture Behavioral of mux2_1tb is
COMPONENT mux2_1 Port (
           X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           Sel : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

    signal X,Y,Z: std_logic_vector (15 downto 0):= (others=>'0');
    signal Sel: std_logic;

begin
 uut: mux2_1 PORT MAP(
    X=>X,
    Y=>Y,
    Z=>Z,
    Sel=>Sel
    );
    stim_proc: process

begin
    X<="0000000011111111";
    Y<="1111111100000000";
    
    Sel<='0';
    wait for 5ns;
    Sel<='1';
    wait for 5ns;
end process;


end Behavioral;
