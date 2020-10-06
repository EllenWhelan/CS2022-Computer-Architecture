----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2019 11:26:35
-- Design Name: 
-- Module Name: halfadder_tb - Behavioral
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

entity halfadder_tb is
--  Port ( );
end halfadder_tb;

architecture Behavioral of halfadder_tb is
COMPONENT half_adder is
 port(
            x,y : in std_logic;
            s,c: out std_logic
         );
END COMPONENT;

--inputs
    signal x,y: std_logic;
--outputs
    signal s,c: std_logic;
    
    
begin
    uut: half_adder PORT MAP(
    x=>x,
    y=>y,
    s=>s,
    c=>c
    );
    stim_proc: process
    
    begin
        x<='0';
        y<='0';
        wait for 5ns;
        x<='0';
        y<='1';
        wait for 5ns;
        x<='1';
        y<='0';
        wait for 5ns;
        x<='1';
        y<='1';
        wait for 5ns;
    end process;
       
end Behavioral;
