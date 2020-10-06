----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2019 16:46:21
-- Design Name: 
-- Module Name: data_path - Behavioral
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

entity data_path is
    Port ( ctrl_word : in STD_LOGIC_VECTOR (16 downto 0);
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           constant_in: in std_logic_vector (15 downto 0);
           clk: in std_logic;
           adr_out : out STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           V,C,Z,N: out std_logic);
end data_path;

architecture Behavioral of data_path is
COMPONENT Reg_file
Port ( 
        a: in std_logic_vector (2 downto 0);
        b: in std_logic_vector (2 downto 0);
        dec_A: in std_logic_vector (2 downto 0);
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

--SIGNALS
signal muxD_output, muxB_output, regfileA_out, regfileB_out,muxD_x_input: std_logic_vector(15 downto 0):= (others=>'0');
begin
    register_file: Reg_file PORT MAP(
    a=> ctrl_word(13 downto 11),
    b=>ctrl_word(10 downto 8),
    dec_A=>ctrl_word(16 downto 14),
    clk=>clk,
    data=>muxD_output,
    a_out=> regfileA_out,
    b_out=>regfileB_out,
    load_enable=>ctrl_word(0)
    );
    
    func_ut: function_unit PORT MAP(
       A =>regfileA_out,
       B =>muxB_output,
       fs=>ctrl_word(6 downto 2),
       N =>N,
       Z =>Z,
       V=>V,
       C=>C,
       F =>muxD_x_input
    );
    
    muxB: mux2_1 PORT MAP(
       X=>regfileB_out,
       Y=>constant_in,
       Sel=>ctrl_word(7),
       Z=> muxB_output
    );
    
    muxD: mux2_1 PORT MAP(
        X =>muxD_x_input,
        Y =>data_in,
        Sel=>ctrl_word(1),
        Z =>muxD_output
    );

    adr_out<=regfileA_out;
    data_out<=muxB_output;
end Behavioral;
