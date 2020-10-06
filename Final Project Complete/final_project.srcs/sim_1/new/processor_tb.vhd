
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity processor_tb is
end processor_tb;

architecture Behavioral of processor_tb is

    COMPONENT processor PORT (
        reset : in std_logic;
        Clk : in std_logic;
        PC_val, instr : out std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    signal reset : std_logic;
    signal Clk : std_logic := '0';
    signal PC_val, instr : std_logic_vector(15 downto 0);
    
    constant clk_period : time := 120 ns;

begin

    Clk <= not Clk after clk_period/2;

    uut : processor PORT MAP (
        reset => reset,
        Clk => Clk,
        PC_val => PC_val,
        instr => instr
    );
    
    sim_proc : process
    begin
    
    reset <= '1';
    wait for clk_period;
    
    reset <= '0';
    wait for clk_period*30;

    end process;

end Behavioral;
