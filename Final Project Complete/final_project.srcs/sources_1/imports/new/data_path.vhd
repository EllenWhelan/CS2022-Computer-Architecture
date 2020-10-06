
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_path is
    Port ( 
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
end data_path;

architecture Behavioral of data_path is
COMPONENT Reg_file
Port ( 
        a: in std_logic_vector (3 downto 0);
        b: in std_logic_vector (3 downto 0);
        dec_A: in std_logic_vector (3 downto 0);
        clk: in std_logic ; --reg
        data: in std_logic_vector (15 downto 0);
        a_out: out std_logic_vector (15 downto 0);
        b_out: out std_logic_vector (15 downto 0);
        load_enable : in std_logic --write for and with dec output
        
        );
END COMPONENT;
COMPONENT function_unit
Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           fs : in STD_LOGIC_VECTOR (4 downto 0);
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           V : out std_logic;
           C: out std_logic;
           F : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

COMPONENT mux2_1
 Port ( X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           Sel : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT; 

COMPONENT zero_fill
 Port ( zero_SB : in STD_LOGIC_VECTOR (2 downto 0);
           zero_out : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

--SIGNALS

signal muxD_output, muxB_output,muxMout, regfileA_out, regfileB_out,muxD_x_input, zerofill_out: std_logic_vector(15 downto 0);
begin
    register_file: Reg_file PORT MAP(
    a(2 downto 0)=>SA ,
    a(3)=>TA,
    b(2 downto 0)=>SB,
    b(3)=>TB,
    dec_A(2 downto 0)=> DR,
    dec_A(3)=>TD,
    clk=>clk,
    data=>muxD_output,
    a_out=> regfileA_out,
    b_out=>regfileB_out,
    load_enable=>RW
    );
    
    func_ut: function_unit PORT MAP(
       A =>regfileA_out,
       B =>muxB_output,
       fs=>FS,
       N =>N,
       Z =>Z,
       V=>V,
       C=>C,
       F =>muxD_x_input
    );
    
    muxB: mux2_1 PORT MAP(
       X=>regfileB_out,
       Y=>zerofill_out,
       Sel=>MB,
       Z=> muxB_output
    );
    
    muxD: mux2_1 PORT MAP(
        X =>muxD_x_input,
        Y =>data_in,
        Sel=>MD,
        Z =>muxD_output
    );
    
    muxM: mux2_1 PORT MAP(
        X=>regfileA_out,
        Y=> PC_out,
        Sel=>MM,
        Z=>muxMout
    );
     zeroFill: zero_fill PORT MAP(
        zero_SB=>constant_in,
        zero_out=>zerofill_out
        );
    data_out<=muxB_output;
    adr_out<=muxMout;
end Behavioral;
