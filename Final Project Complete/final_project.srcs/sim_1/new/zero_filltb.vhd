----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2019 15:01:36
-- Design Name: 
-- Module Name: zero_filltb - Behavioral
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

entity zero_filltb is
--  Port ( );
end zero_filltb;

architecture Behavioral of zero_filltb is
COMPONENT zero_fill PORT(
    zero_SB : in STD_LOGIC_VECTOR (2 downto 0);
    zero_out : out STD_LOGIC_VECTOR (15 downto 0)
);
END COMPONENT;
--signals 
signal zero_sb: std_logic_vector (2 downto 0):= (others=>'0');
signal zero_out:std_logic_vector (15 downto 0) := (others=>'0');
begin
uut: zero_fill PORT MAP(
    zero_SB=>zero_sb,
    zero_out=> zero_out
    );

stim_proc:process
begin
    zero_SB<="111";
    wait for 5ns;
    zero_SB<="010";
    wait for 5ns;
end process;

end Behavioral;
