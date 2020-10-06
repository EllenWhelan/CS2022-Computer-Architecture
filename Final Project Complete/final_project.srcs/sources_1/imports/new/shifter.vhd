----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 18:27:04
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
    Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           h_sel : in STD_LOGIC_VECTOR (1 downto 0);
           Ir : in STD_LOGIC;
           Il : in STD_LOGIC;
           h : out STD_LOGIC_VECTOR (15 downto 0));
end shifter;

architecture Behavioral of shifter is
    COMPONENT mux3_1 port(
    B_curr, B_prev, B_next :in std_logic;
    h_sel: in std_logic_vector (1 downto 0);
    h: out std_logic
    );
    END COMPONENT;

--signals 

begin
   mux0: mux3_1 PORT MAP(
    B_curr=>B(0),
    B_prev=>Ir,
    B_next=>B(1),
    h_sel=>h_sel,
    h=>h(0)
    );
        
    mux1: mux3_1 PORT MAP(
    B_curr=>B(1),
    B_prev=>B(0),
    B_next=>B(2),
    h_sel=>h_sel,
    h=>h(1)
    );
    mux2: mux3_1 PORT MAP(
    B_curr=>B(2),
    B_prev=>B(1),
    B_next=>B(3),
    h_sel=>h_sel,
    h=>h(2)
    );
    
   mux3: mux3_1 PORT MAP(
    B_curr=>B(3),
    B_prev=>B(2),
    B_next=>B(4),
    h_sel=>h_sel,
    h=>h(3)
    );
    mux4: mux3_1 PORT MAP(
    B_curr=>B(4),
    B_prev=>B(3),
    B_next=>B(5),
    h_sel=>h_sel,
    h=>h(4)
    );
    mux5: mux3_1 PORT MAP(
    B_curr=>B(5),
    B_prev=>B(4),
    B_next=>B(6),
    h_sel=>h_sel,
    h=>h(5)
    );
    mux6: mux3_1 PORT MAP(
    B_curr=>B(6),
    B_prev=>B(5),
    B_next=>B(7),
    h_sel=>h_sel,
    h=>h(6)
    );
    mux7: mux3_1 PORT MAP(
    B_curr=>B(7),
    B_prev=>B(6),
    B_next=>B(8),
    h_sel=>h_sel,
    h=>h(7)
    );
    mux8: mux3_1 PORT MAP(
    B_curr=>B(8),
    B_prev=>B(7),
    B_next=>B(9),
    h_sel=>h_sel,
    h=>h(8)
    );
    mux9: mux3_1 PORT MAP(
    B_curr=>B(9),
    B_prev=>B(8),
    B_next=>B(10),
    h_sel=>h_sel,
    h=>h(9)
    );
    mux10: mux3_1 PORT MAP(
    B_curr=>B(10),
    B_prev=>B(9),
    B_next=>B(11),
    h_sel=>h_sel,
    h=>h(10)
    );
    mux11: mux3_1 PORT MAP(
    B_curr=>B(11),
    B_prev=>B(10),
    B_next=>B(12),
    h_sel=>h_sel,
    h=>h(11)
    );
    mux12: mux3_1 PORT MAP(
    B_curr=>B(12),
    B_prev=>B(11),
    B_next=>B(13),
    h_sel=>h_sel,
    h=>h(12)
    );
    mux13: mux3_1 PORT MAP(
    B_curr=>B(13),
    B_prev=>B(12),
    B_next=>B(14),
    h_sel=>h_sel,
    h=>h(13)
    );
    mux14: mux3_1 PORT MAP(
    B_curr=>B(14),
    B_prev=>B(13),
    B_next=>B(15),
    h_sel=>h_sel,
    h=>h(14)
    );
    mux15: mux3_1 PORT MAP(
    B_curr=>B(15),
    B_prev=>B(14),
    B_next=>Il,
    h_sel=>h_sel,
    h=>h(15)
    );
    
    
    

end Behavioral;
