----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 17:28:07
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           g_sel : in STD_LOGIC_VECTOR (3 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is
COMPONENT  arithmetic_circuit Port ( 
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Cout : out STD_LOGIC;
           V: out std_logic;
           G : out STD_LOGIC_VECTOR (15 downto 0)
           );
END COMPONENT;

COMPONENT logic_circuit Port (
            A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0)
           );
END COMPONENT;

COMPONENT mux2_1  Port ( 
           X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           Sel : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0)
           );
END COMPONENT;
--signals
signal mux_in_logic, mux_in_arith: std_logic_vector (15 downto 0) := (others=>'0');

begin
    log_circ: logic_circuit PORT MAP(
        A=>A,
        B=>B,
        S0=> g_sel(1),
        S1=>g_sel(2),
        G=> mux_in_logic
        );
    arith_circ: arithmetic_circuit PORT MAP(
       A =>A,
       B =>B,
       Cin=> g_sel(0),
       S0=>g_sel(1),
       S1=>g_sel(2),
       Cout=>C,
       V=>V,
       G=> mux_in_arith
       );
       
   muxALU: mux2_1 PORT MAP(
         X=>mux_in_arith,
         Y=>mux_in_logic,
         Sel=>g_sel(3),
         Z=>G
         );
         
         


end Behavioral;
