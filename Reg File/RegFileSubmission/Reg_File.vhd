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
        src_s0: in std_logic; --mux8_16
        src_s1: in std_logic;
        src_s2: in std_logic;
        dec_A0: in std_logic; --decoder3_8
        dec_A1: in std_logic;
        dec_A2: in std_logic;
        clk: in std_logic ; --reg
        data_src: in std_logic ;--mux2_16
        data: in std_logic_vector (15 downto 0); 
        reg0: out std_logic_vector (15 downto 0); --register outouts
        reg1: out std_logic_vector (15 downto 0); --register outouts
        reg2: out std_logic_vector (15 downto 0); --register outouts
        reg3: out std_logic_vector (15 downto 0); --register outouts
        reg4: out std_logic_vector (15 downto 0); --register outouts
        reg5: out std_logic_vector (15 downto 0); --register outouts
        reg6: out std_logic_vector (15 downto 0); --register outouts
        reg7: out std_logic_vector (15 downto 0) --register outouts
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
    
-- signals
signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7: std_logic;
-- signals
signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, data_src_mux_out, src_reg: std_logic_vector(15 downto 0):=(others =>'0');
      
begin
     --portmaps
     --registers
    -- register 0
    reg000: reg16 PORT MAP(
    D => data_src_mux_out,
    load => load_reg0,
    Clk => Clk,
    Q => reg0_q
    );
    
     -- register 1
    reg001: reg16 PORT MAP(
    D => data_src_mux_out,
    load => load_reg1,
    Clk => Clk,
    Q => reg1_q
    );
    
     -- register 2
    reg010: reg16 PORT MAP(
    D => data_src_mux_out,
    load => load_reg2,
    Clk => Clk,
    Q => reg2_q
    );
    
     -- register 3
    reg011: reg16 PORT MAP(
    D => data_src_mux_out,
    load => load_reg3,
    Clk => Clk,
    Q => reg3_q
    );
    
     -- register 4
    reg100: reg16 PORT MAP(
    D => data_src_mux_out,
    load => load_reg4,
    Clk => Clk,
    Q => reg4_q
    );
    
     -- register 5
    reg101: reg16 PORT MAP(
    D => data_src_mux_out,
    load => load_reg5,
    Clk => Clk,
    Q => reg5_q
    );
    
     -- register 6
    reg110: reg16 PORT MAP(
    D => data_src_mux_out,
    load => load_reg6,
    Clk => Clk,
    Q => reg6_q
    );
    
     -- register 7
    reg111: reg16 PORT MAP(
    D => data_src_mux_out,
    load => load_reg7,
    Clk => Clk,
    Q => reg7_q
    );
    
    --decoder
    des_decoder_3to8: decoder3_8 PORT MAP(
        A0 => dec_A0,
        A1 => dec_A1,
        A2=> dec_A2,
        Q0 => load_reg0,
        Q1 => load_reg1,
        Q2 => load_reg2,
        Q3 => load_reg3,
        Q4 => load_reg4,
        Q5 => load_reg5,
        Q6 => load_reg6,
        Q7 => load_reg7
        );
        
    --mux 2to16
    data_src_mux_2_16bit: mux2_16 PORT MAP
    (
        In0=> data,
        In1=>src_reg,
        s=>data_src,
        Z=>data_src_mux_out
    );
    --mux 8to16
    inst_mux8_16bit: mux8_16 PORT MAP
    (
        In0 => reg0_q,
        In1 => reg1_q,
        In2 => reg2_q,
        In3 => reg3_q,
        In4 => reg4_q,
        In5 => reg5_q,
        In6 => reg6_q,
        In7 => reg7_q,
        s0 => src_s0,
        s1=> src_s1,
        s2=>src_s2,
        z=>src_reg
        );
        
        reg0 <= reg0_q;
        reg1 <= reg1_q;
        reg2 <= reg2_q;
        reg3 <= reg3_q;
        reg4 <= reg4_q;
        reg5 <= reg5_q;
        reg6 <= reg6_q;
        reg7 <= reg7_q;
        

end Behavioral;
