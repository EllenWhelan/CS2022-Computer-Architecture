library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAR_tb is
end CAR_tb;

architecture Behavioral of CAR_tb is

    COMPONENT CAR PORT (
        loaded_adr : in std_logic_vector(7 downto 0);
        load_car : in std_logic;
        reset : in std_logic;
        clk : in std_logic;
        car_out : inout std_logic_vector(7 downto 0)
    );
    END COMPONENT;
    
    -- inputs
    signal loaded_adr : std_logic_vector(7 downto 0);
    signal load_car, reset : std_logic;
    signal clk : std_logic := '0';
    signal car_out : std_logic_vector(7 downto 0);
    
    constant clk_period : time := 110 ns;

begin

    clk <= not clk after clk_period/2;
    
    uut : CAR PORT MAP (
        reset => reset,
        loaded_adr => loaded_adr,
        load_car => load_car,
        clk => clk,
        car_out => car_out
    );
    
    stim_proc : process
    begin

    reset <= '1';
    load_car <= '1';
    loaded_adr <= X"00";
    wait for clk_period;
    
    reset <= '0';
    wait for clk_period;
    
    load_car <= '0';
    wait for 2 * clk_period;
    

    end process;

end Behavioral;
