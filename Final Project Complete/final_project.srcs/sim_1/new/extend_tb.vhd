library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity extend_tb is
end extend_tb;

architecture Behavioral of extend_tb is

    COMPONENT extend PORT (
        dr_in, sb_in : in std_logic_vector(2 downto 0);
        Z : out std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    -- inputs
    signal dr_in, sb_in : std_logic_vector(2 downto 0);
    
    -- outputs
    signal Z : std_logic_vector(15 downto 0);

begin

    uut : extend PORT MAP (
        dr_in => dr_in,
        sb_in => sb_in,
        Z => Z
    );
    
    stim_proc : process
    begin
    
    dr_in <= "000";
    sb_in <= "111";
    wait for 10 ns;
    
    dr_in <= "101";
    sb_in <= "010";
    wait for 10 ns;

    end process;

end Behavioral;
