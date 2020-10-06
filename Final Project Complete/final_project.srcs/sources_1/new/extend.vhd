library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity extend is
    Port (
        dr_in, sb_in : in std_logic_vector(2 downto 0);
        Z : out std_logic_vector(15 downto 0)
    );
end extend;

architecture Behavioral of extend is

begin

Z(15 downto 6) <= "0000000000" after 5 ns;
Z(5 downto 3) <= dr_in after 5 ns;
Z(2 downto 0) <= sb_in after 5 ns;



end Behavioral;
