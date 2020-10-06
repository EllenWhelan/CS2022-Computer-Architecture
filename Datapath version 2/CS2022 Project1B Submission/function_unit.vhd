----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 18:58:51
-- Design Name: 
-- Module Name: function_unit - Behavioral
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

entity function_unit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           fs : in STD_LOGIC_VECTOR (4 downto 0);
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           V : out std_logic;
           C: out std_logic;
           F : out STD_LOGIC_VECTOR (15 downto 0));
end function_unit;

architecture Behavioral of function_unit is
COMPONENT ALU
     Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           g_sel : in STD_LOGIC_VECTOR (3 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;
COMPONENT shifter
 Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           h_sel : in STD_LOGIC_VECTOR (1 downto 0);
           Ir : in STD_LOGIC;
           Il : in STD_LOGIC;
           h : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;
COMPONENT mux2_1 Port ( 
           X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           Sel : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0)
           );

END COMPONENT;

signal muxin_g_alu, muxin_h_shift :std_logic_vector (15 downto 0):= (others=>'0');

begin
    aluFU: ALU PORT MAP(
           A =>A,
           B=>B,
           g_sel=>fs(3 downto 0),
           V =>V,
           C=>C,
           G=>muxin_g_alu
    );
    
    shift: shifter PORT MAP(
           B=>B,
           h_sel=>fs(3 downto 2),
           Ir =>'0',
           Il=>'0',
           h => muxin_h_shift
           );
           
       muxFU: mux2_1 PORT MAP(
        X=>muxin_g_alu,
        Y =>muxin_h_shift,
        Sel=>fs(4),
         Z=>F
       );

    N<= muxin_g_alu(15);
    Z<='1' when muxin_g_alu ="0000000000000000" else '0';

end Behavioral;
