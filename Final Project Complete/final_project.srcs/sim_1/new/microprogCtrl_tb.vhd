
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity microprogCtrltrl_tb is
end microprogCtrltrl_tb;

architecture Behavioral of microprogCtrltrl_tb is

    COMPONENT microprog_ctrl PORT (
        reset : in std_logic;
        Clk : in std_logic;
        VCNZ : in std_logic_vector(3 downto 0);
        instr_in : in std_logic_vector(15 downto 0);
        TDDR_out, TASA_out, TBSB_out : out std_logic_vector(3 downto 0);
        FS_out : out std_logic_vector(4 downto 0);
        MB_out, MD_out, MM_out, RW_out, MW_out : out std_logic;
        PC_out : out std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    -- inputs
    signal reset : std_logic;
    signal Clk : std_logic := '0';
    signal VCNZ : std_logic_vector(3 downto 0);
    signal instr_in : std_logic_vector(15 downto 0);
    
    -- outputs
    signal TDDR_out, TASA_out, TBSB_out : std_logic_vector(3 downto 0);
    signal FS_out : std_logic_vector(4 downto 0);
    signal MB_out, MD_out, MM_out, RW_out, MW_out : std_logic;
    signal PC_out : std_logic_vector(15 downto 0);
    
    constant clk_period : time := 110 ns;

begin

    Clk <= not Clk after clk_period/2;
    
    uut : microprog_ctrl PORT MAP (
        reset => reset,
        Clk => Clk,
        VCNZ => VCNZ,
        instr_in => instr_in,
        TDDR_out => TDDR_out,
        TASA_out => TASA_out,
        TBSB_out => TBSB_out,
        FS_out => FS_out,
        MB_out => MB_out,
        MD_out => MD_out,
        MM_out => MM_out,
        RW_out => RW_out,
        MW_out => MW_out,
        PC_out => PC_out
    );
    
    stim_proc : process
    begin

    -- opcode = 0000000, DR = 010, SA = 100, SB = 001
    reset <= '1';
    VCNZ <= "0000";
    instr_in <= "0000000010100001";
    wait for clk_period;
    
    reset <= '0';
    wait for clk_period*2;
    
    instr_in <= "0000001010100001";
    wait for clk_period*2;
    
    instr_in <= "0000010010100001";
    wait for clk_period*2;

    end process;

end Behavioral;
