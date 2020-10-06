---
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity controlMemory_tb is
end controlMemory_tb;

architecture Behavioral of controlMemory_tb is

    COMPONENT control_memory PORT (
        MW : out std_logic;
        MM : out std_logic;
        RW : out std_logic;
        MD : out std_logic;
        FS : out std_logic_vector(4 downto 0);
        MB : out std_logic;
        TB : out std_logic;
        TA : out std_logic;
        TD : out std_logic;
        PL : out std_logic;
        PI : out std_logic;
        IL : out std_logic;
        MC : out std_logic;
        MS : out std_logic_vector(2 downto 0);
        NA : out std_logic_vector(7 downto 0);
        IN_CAR : in std_logic_vector(7 downto 0)
    );
    END COMPONENT;
    
    -- inputs
    signal IN_CAR : std_logic_vector(7 downto 0);
    
    -- outputs
    signal MW, MM, RW, MD, MB, TB, TA, TD, PL, PI, IL, MC : std_logic;
    signal MS : std_Logic_vector(2 downto 0);
    signal FS : std_logic_vector(4 downto 0);
    signal NA : std_logic_vector(7 downto 0);

begin

    uut : control_memory PORT MAP (
        IN_CAR => IN_CAR,
        MW => MW,
        MM => MM,
        RW => RW,
        MD => MD,
        MB => MB,
        TD => TD,
        TA => TA,
        TB => TB,
        PL => PL,
        PI => PI,
        IL => IL,
        MC => MC,
        MS => MS,
        FS => FS,
        NA => NA
    );
    
    stim_proc : process
    begin
    
    IN_CAR <= X"00";
    wait for 10 ns;
    
    IN_CAR <= X"08";
    wait for 10 ns;
    
     IN_CAR <= X"0A";
    wait for 10 ns;
    
     IN_CAR <= X"22";
    wait for 10 ns;
    
    end process;

end Behavioral;
