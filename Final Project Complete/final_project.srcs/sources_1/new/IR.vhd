library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IR is
    Port (
        clk : in std_logic;
        IR_in : in std_logic_vector(15 downto 0);
        IL : in std_logic;
        op_code : out std_logic_vector(6 downto 0);
        DR, SA, SB : out std_logic_vector(2 downto 0)
    );
end IR;

architecture Behavioral of IR is

begin


process(clk)

begin
    if(rising_edge(clk)) then
        if IL = '1' then
            op_code <= IR_in(15 downto 9);
            DR <= IR_in(8 downto 6);
            SA <= IR_in(5 downto 3);
            SB <= IR_in(2 downto 0);
        end if;
    end if;
end process;


end Behavioral;
