
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity microprog_ctrl is
    Port (
        reset : in std_logic;
        Clk : in std_logic;
        VCNZ : in std_logic_vector(3 downto 0);
        instr_in : in std_logic_vector(15 downto 0);
        TDDR_out, TASA_out, TBSB_out : out std_logic_vector(3 downto 0);
        FS_out : out std_logic_vector(4 downto 0);
        MB_out, MD_out, MM_out, RW_out, MW_out : out std_logic;
        PC_out : out std_logic_vector(15 downto 0)
    );
end microprog_ctrl;

architecture Behavioral of microprog_ctrl is

component CAR port (
    reset : in std_logic;
    loaded_adr : in std_logic_vector(7 downto 0);
    load_car : in std_logic;
    clk : in std_logic;
    car_out : inout std_logic_vector(7 downto 0)
);
end component;

component PC port (
    reset : in std_logic;
    clk : in std_logic;
    load_adr : in std_logic_vector(15 downto 0);
    PL, PI : in std_logic;
    PC_out : inout std_logic_vector(15 downto 0)
);
end component;

component extend port (
    dr_in, sb_in : in std_logic_vector(2 downto 0);
    Z : out std_logic_vector(15 downto 0)
);
end component;

component IR port (
     clk : in std_logic;
        IR_in : in std_logic_vector(15 downto 0);
        IL : in std_logic;
        op_code : out std_logic_vector(6 downto 0);
        DR, SA, SB : out std_logic_vector(2 downto 0)
);
end component;

component control_memory 
   Port ( MW : out std_logic;
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
IN_CAR : in std_logic_vector(7 downto 0));
end component;

component mux8_1 Port(
        N: in std_logic;
        Z: in std_logic;
        V: in std_logic;
        C: in std_logic;
        not_Z: in std_logic;
        not_C: in std_logic;
        zero: in std_logic;
        one: in std_logic;
        MS: in std_logic_vector(2 downto 0);
        muxS_out: out std_logic
    );
end component;

component mux2_8bit port (
    in0, in1 : in std_logic_vector(7 downto 0);
    s : in std_logic;
    Z : out std_logic_vector(7 downto 0)
);
end component;


    signal extout, pcval : std_logic_vector(15 downto 0);
    signal PI, PL, IL, muxSout, MC : std_logic;
    signal DR, SA, SB, MS : std_logic_vector(2 downto 0);
    signal opcode, muxCout, car_out, NA : std_logic_vector(7 downto 0);
    signal notZC : std_logic_vector(1 downto 0);

begin

    prog_c : PC port map (
        reset => reset,
        Clk => Clk,
        load_adr => extout,
        PI => PI,
        PL => PL,
        PC_out => pcval
    );
    
    PC_out <= pcval;
    
    xtend : extend port map (
        dr_in => DR,
        sb_in => SB,
        Z => extout
    );
    
    TDDR_out(2 downto 0) <= DR;
    TASA_out(2 downto 0) <= SA;
    TBSB_out(2 downto 0) <= SB;
    
    inst_reg : IR port map (
        Clk => Clk,
        ir_in => instr_in,
        IL => IL,
        DR => DR,
        SA => SA,
        SB => SB,
        op_code => opcode(6 downto 0)
    );
    
    opcode(7) <= '0';
    
    muxC : mux2_8bit port map (
        in0 => NA,
        in1 => opcode,
        s => MC,
        Z => muxCout
    );
    
    ctrl_reg : CAR port map (
        reset => reset,
        loaded_adr => muxCout,
        load_car => muxSout,
        Clk => Clk,
        car_out => car_out
    );
    
    ctrl_mem : control_memory port map (
        in_car => car_out,
        MW => MW_out,
        MM => MM_out,
        RW => RW_out,
        MD => MD_out,
        FS => FS_out,
        MB => MB_out,
        TB => TBSB_out(3),
        TA => TASA_out(3),
        TD => TDDR_out(3),
        PL => PL,
        PI => PI,
        IL => IL,
        MC => MC,
        MS => MS,
        NA => NA
    );
    
    notZC(0) <= not VCNZ(2);
    notZC(1) <= not VCNZ(0);
    
    muxS : mux8_1 port map (
        zero => '0',
        one => '1',
        C => VCNZ(2),
        V => VCNZ(3),
        Z => VCNZ(0),
        N => VCNZ(1),
        not_C => notZC(0),
        not_Z => notZC(1),
        MS => MS,
        muxS_out => muxSout
    );
    


end Behavioral;
