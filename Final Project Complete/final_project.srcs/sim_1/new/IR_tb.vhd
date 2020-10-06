library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IR_tb is
end IR_tb;

architecture Behavioral of IR_tb is

    COMPONENT IR PORT (
        clk : in std_logic;
        IR_in : in std_logic_vector(15 downto 0);
        IL : in std_logic;
        op_code : out std_logic_vector(6 downto 0);
        DR, SA, SB : out std_logic_vector(2 downto 0)
    );
    END COMPONENT;
    
    -- inputs
    signal clk : std_logic := '0';
    signal IR_in : std_logic_vector(15 downto 0);
    signal IL : std_logic;
   
    signal op_code : std_logic_vector(6 downto 0);
    signal DR, SA, SB : std_logic_vector(2 downto 0);
    
    constant clk_period : time := 10 ns;

begin

    Clk <= not Clk after clk_period/2;
    
    uut : IR PORT MAP (
        clk => clk,
        IR_in => IR_in,
        IL => IL,
        op_code => op_code,
        DR => DR,
        SA => SA,
        SB => SB
    );
    
    stim_proc : process
    begin

    IR_in <= "0000111100001111" ;--"0010101010111110";
    IL <= '0';
    wait for clk_period;
    
    IL <= '1';
    wait for clk_period;

    end process;

end Behavioral;
