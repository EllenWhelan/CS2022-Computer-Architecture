----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2019 17:26:02
-- Design Name: 
-- Module Name: Reg_File - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_File is
  Port ( 
            a: in std_logic_vector (2 downto 0);
            b: in std_logic_vector (2 downto 0);
        --src_s0: in std_logic; --mux8_16
        --src_s1: in std_logic;
        --src_s2: in std_logic;
        dec_A: in std_logic_vector (2 downto 0);
        --dec_A0: in std_logic; --decoder3_8
        --dec_A1: in std_logic;
        --dec_A2: in std_logic;
        clk: in std_logic ; --reg
        --data_src: in std_logic ;--mux2_16
        data: in std_logic_vector (15 downto 0);
        a_out: out std_logic_vector (15 downto 0);
        b_out: out std_logic_vector (15 downto 0);
        load_enable : in std_logic --write for and with dec output
        --reg0: out std_logic_vector (15 downto 0); --register outouts
        --reg1: out std_logic_vector (15 downto 0); --register outouts
        --reg2: out std_logic_vector (15 downto 0); --register outouts
        --reg3: out std_logic_vector (15 downto 0); --register outouts
        --reg4: out std_logic_vector (15 downto 0); --register outouts
        --reg5: out std_logic_vector (15 downto 0); --register outouts
        --reg6: out std_logic_vector (15 downto 0); --register outouts
        --reg7: out std_logic_vector (15 downto 0) --register outouts
        );
        
end Reg_File;

architecture Behavioral of Reg_File is
--components
    COMPONENT reg16
    PORT(
        D: in std_logic_vector(15 downto 0);
        load: in std_logic;
        clk: in std_logic;
        Q: out std_logic_vector (15 downto 0)
        );
    END COMPONENT;
    
    COMPONENT decoder3_8
    PORT(
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC
           );
    END COMPONENT;
    
    COMPONENT mux2_16
    PORT(
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0)
           );
    END COMPONENT;
    
    COMPONENT mux8_16
    PORT(
           s0 : in STD_LOGIC;
           s1: in std_logic;
           s2: in std_logic;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           In2 : in STD_LOGIC_VECTOR (15 downto 0);
           In3 : in STD_LOGIC_VECTOR (15 downto 0);
           In4 : in STD_LOGIC_VECTOR (15 downto 0);
           In5 : in STD_LOGIC_VECTOR (15 downto 0);
           In6 : in STD_LOGIC_VECTOR (15 downto 0);
           In7 : in STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC_VECTOR (15 downto 0)
           );
    END COMPONENT;
    
    COMPONENT and_gate
    PORT(
        load_enable : in STD_LOGIC;
           dec_in : in STD_LOGIC;
           reg_load: out STD_LOGIC);
       END COMPONENT;
    
-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7: std_logic;
-- signals
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, data_src_mux_out, src_reg: std_logic_vector(15 downto 0):=(others =>'0');
signal and_dec0, and_dec1, and_dec2, and_dec3, and_dec4, and_dec5, and_dec6, and_dec7: std_logic;   
begin
     --portmaps
     --registers
    -- register 0
    reg000: reg16 PORT MAP(
    D => data,
    load => load_reg0 ,
    Clk => Clk,
    Q => reg0_q
    );
    
     -- register 1
    reg001: reg16 PORT MAP(
    D => data,
    load => load_reg1,
    Clk => Clk,
    Q => reg1_q
    );
    
     -- register 2
    reg010: reg16 PORT MAP(
    D => data,
    load => load_reg2,
    Clk => Clk,
    Q => reg2_q
    );
    
     -- register 3
    reg011: reg16 PORT MAP(
    D => data,
    load => load_reg3,
    Clk => Clk,
    Q => reg3_q
    );
    
     -- register 4
    reg100: reg16 PORT MAP(
    D => data,
    load => load_reg4,
    Clk => Clk,
    Q => reg4_q
    );
    
     -- register 5
    reg101: reg16 PORT MAP(
    D => data,
    load => load_reg5,
    Clk => Clk,
    Q => reg5_q
    );
    
     -- register 6
    reg110: reg16 PORT MAP(
    D => data,
    load => load_reg6,
    Clk => Clk,
    Q => reg6_q
    );
    
     -- register 7
    reg111: reg16 PORT MAP(
    D => data,
    load => load_reg7,
    Clk => Clk,
    Q => reg7_q
    );
    
    --decoder
    des_decoder_3to8: decoder3_8 PORT MAP(
        A0 => dec_A(0),
        A1 => dec_A(1),
        A2=> dec_A(2),
        Q0 => and_dec0,
        Q1 => and_dec1,
        Q2 => and_dec2,
        Q3 => and_dec3,
        Q4 => and_dec4,
        Q5 => and_dec5,
        Q6 => and_dec6,
        Q7 => and_dec7
        );
        
    --mux 2to16
    --data_src_mux_2_16bit: mux2_16 PORT MAP
    --(
      --  In0=> data,
        --In1=>src_reg,
        --s=>data_src,
        --Z=>data_src_mux_out
    --);
    --mux 8to16
    inst_mux8_16bita: mux8_16 PORT MAP
    (
        In0 => reg0_q,
        In1 => reg1_q,
        In2 => reg2_q,
        In3 => reg3_q,
        In4 => reg4_q,
        In5 => reg5_q,
        In6 => reg6_q,
        In7 => reg7_q,
        s0 => a(0),
        s1=> a(1),
        s2=>a(2),
        z=>a_out
        );
        
        inst_mux8_16bitb: mux8_16 PORT MAP
    (
        In0 => reg0_q,
        In1 => reg1_q,
        In2 => reg2_q,
        In3 => reg3_q,
        In4 => reg4_q,
        In5 => reg5_q,
        In6 => reg6_q,
        In7 => reg7_q,
        s0 => b(0),
        s1=> b(1),
        s2=>b(2),
        z=>b_out
        );
        
       
        and0: and_gate PORT MAP(
        load_enable=>load_enable,
        dec_in=>and_dec0,
        reg_load=>load_reg0
        );
   
        and1: and_gate PORT MAP(
        load_enable=>load_enable,
        dec_in=>and_dec1,
        reg_load=>load_reg1
        );
        and2: and_gate PORT MAP(
        load_enable=>load_enable,
        dec_in=>and_dec2,
        reg_load=>load_reg2
        );
        and3: and_gate PORT MAP(
        load_enable=>load_enable,
        dec_in=>and_dec3,
        reg_load=>load_reg3
        );
        and4: and_gate PORT MAP(
        load_enable=>load_enable,
        dec_in=>and_dec4,
        reg_load=>load_reg4
        );
        and5: and_gate PORT MAP(
        load_enable=>load_enable,
        dec_in=>and_dec5,
        reg_load=>load_reg5
        );
        and6: and_gate PORT MAP(
        load_enable=>load_enable,
        dec_in=>and_dec6,
        reg_load=>load_reg6
        );
        and7: and_gate PORT MAP(
        load_enable=>load_enable,
        dec_in=>and_dec7,
        reg_load=>load_reg7
        );
        
        
        --reg0 <= reg0_q;
        --reg1 <= reg1_q;
        --reg2 <= reg2_q;
        --reg3 <= reg3_q;
        --reg4 <= reg4_q;
        --reg5 <= reg5_q;
        --reg6 <= reg6_q;
        --reg7 <= reg7_q;
        

end Behavioral;
