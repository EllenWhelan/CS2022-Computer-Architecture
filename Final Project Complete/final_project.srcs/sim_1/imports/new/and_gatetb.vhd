----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 12:27:20
-- Design Name: 
-- Module Name: and_gatetb - Behavioral
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

entity and_gatetb is

end and_gatetb;

architecture Behavioral of and_gatetb is
    COMPONENT and_gate Port ( load_enable : in STD_LOGIC;
           dec_in : in STD_LOGIC;
           reg_load: out STD_LOGIC);
       END COMPONENT;

signal load_enable, dec_in: std_logic;
signal reg_load: std_logic;

begin
    uut: and_gate PORT MAP(
        dec_in=>dec_in,
        load_enable=>load_enable,
        reg_load=>reg_load    
        );

stim_proc: process
begin
    load_enable<='0';
    dec_in<='0';
    wait for 5ns;
    load_enable<='0';
    dec_in<='1';
    wait for 5ns;
    load_enable<='1';
    dec_in<='0';
    wait for 5ns;
    load_enable<='1';
    dec_in<='1';
    wait for 5ns;
    end process;
    

end Behavioral;
