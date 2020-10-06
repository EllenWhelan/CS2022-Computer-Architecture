
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC_tb is
end PC_tb;

architecture Behavioral of PC_tb is

    COMPONENT PC PORT (
        reset : in std_logic;
        clk : in std_logic;
        load_adr : in std_logic_vector(15 downto 0);
        PI, PL : in std_logic;
        PC_out : inout std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    -- inputs
    signal clk : std_logic := '0';
    signal load_adr : std_logic_vector(15 downto 0);
    signal PI, PL, reset : std_logic;
    signal PC_out : std_logic_vector(15 downto 0);
    
    constant clk_period : time := 110 ns;

begin

    Clk <= not Clk after clk_period/2;
    
    uut : PC PORT MAP (
        reset => reset,
        clk => clk,
        load_adr => load_adr,
        PI => PI,
        PL => PL,
        PC_out => PC_out
    );
    
    stim_proc : process
    begin

    reset <= '1';
    load_adr <= X"00AB";
    PL <= '1';
    PI <= '0';
    wait for clk_period;
    
    reset <= '0';
    wait for clk_period;
    
    PL <= '0';
    PI <= '1';
    wait for clk_period*2;

    end process;

end Behavioral;
