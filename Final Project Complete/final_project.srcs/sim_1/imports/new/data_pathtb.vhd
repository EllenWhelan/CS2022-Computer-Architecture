
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_pathtb is
--  Port ( );
end data_pathtb;

architecture Behavioral of data_pathtb is
COMPONENT data_path
   Port(
            TD : in std_logic;
            TA: in std_logic;
            TB: in std_logic;
            DR: in std_logic_vector( 2 downto 0);
            SA: in std_logic_vector( 2 downto 0);
            SB: in std_logic_vector( 2 downto 0);
            MM, RW, MD, MB: in std_logic;
           FS: in std_logic_vector (4 downto 0);
            constant_in: in std_logic_vector (2 downto 0);
            PC_out : in STD_LOGIC_VECTOR (15 downto 0);
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           --constant_in: in std_logic_vector (15 downto 0);
           clk: in std_logic;
           adr_out : out STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           V,C,Z,N: out std_logic);
END COMPONENT;
--SIGNALS


signal data_in : STD_LOGIC_VECTOR (15 downto 0):= (others =>'0');
signal adr_out, data_out, PC_out:  std_logic_vector (15 downto 0);
signal clk:  std_logic:= '0';
signal FS: std_logic_vector(4 downto 0);
signal V,C,Z,N, TD, TA, TB, MM, RW, MB, MD:  std_logic;
signal DR, SA, SB, constant_in :std_logic_vector(2 downto 0) ;

constant clk_period : time := 10ns;

begin

    clk <= not clk after clk_period/2;
    
uut: data_path PORT MAP(
           fs=>FS,
           
            TD=>TD,
            TA=>TA,
            TB=>TB,
            DR=>DR,
            SA=>SA,
            SB=>SB,
            MM=>MM,
            MD => MD,
        RW => RW,
        MB => MB,
            constant_in=>constant_in,
            PC_out=>PC_out,
           data_in =>data_in,
          
           clk=>clk,
           adr_out=>adr_out,
           data_out=>data_out,
           V=>V,
           C=>C,
           Z=>Z,
           N=>N
);



stim_proc:process
    begin
   MM <= '0';
    
    -- reg01 = 0x5555
    RW <= '1';
    TD<='0';
    DR <= "001";
    MD <= '1';
    data_in <= X"5555";
    
    wait for clk_period;
   
    
    -- reg02 = 0xAAAA
    TD<='0';
    DR <= "010";
    data_in <= X"AAAA";
   
    wait for clk_period;
    
    -- reg00 = reg01 + reg02
    TD<='0';
    DR<="000";
    TA<='0';
    SA<="001";
    TB<='0';
    SB <= "010";
    MB <= '0';
    MD <= '0';
    FS <= "00010";
   
    wait for clk_period;
    
    -- dispaly reg00 (0xFFFF)
    RW <= '0';
    TB<='0';
    SB <= "000";
   
    wait for clk_period;
    
    -- reg04 = reg00 + 1
    RW <= '1';
    MB <= '1';
    constant_in <= "001";
    TD<='0';
    DR <= "100";
    TA<='0';
    SA <= "000";
    
   
    wait for clk_period;
    
    -- display reg04 (0x0000)
    RW <= '0';
    MB <= '0';
    TB<='0';
    SB <= "100";
    
    
    wait for clk_period;
    
    -- address out = PC
    MM <= '1';
    PC_out <= X"1234";
   
    wait for clk_period;
    
    end process;

end Behavioral;
