----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 18:16:59
-- Design Name: 
-- Module Name: mux31_tb - Behavioral
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

entity mux31_tb is
--  Port ( );
end mux31_tb;

architecture Behavioral of mux31_tb is
COMPONENT mux3_1
    port(
        B_curr, B_prev, B_next :in std_logic;
        h_sel: in std_logic_vector (1 downto 0);
        h: out std_logic
    );
END COMPONENT;
--signals
signal B_curr, B_prev, B_next, h: std_logic;
signal h_sel: std_logic_vector (1 downto 0):= (others=>'0');


begin
     uut: mux3_1 PORT MAP(
    B_curr=> B_curr,
    B_prev=>B_prev,
    B_next=>B_next,
    h_sel=>h_sel,
    h=>h
 
    );
    stim_proc: process
    
    begin
    B_curr<='0';
    B_next<='1';
    B_prev<='0';
    
    h_sel<="00";
    wait for 5ns;
    h_sel<="01";
    wait for 5ns;
    h_sel<="10";
    wait for 5ns;
    
    end process;

end Behavioral;
