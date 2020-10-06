----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 15:53:03
-- Design Name: 
-- Module Name: B_input_logic - Behavioral
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

entity B_input_logic is
 Port ( 
       B : in STD_LOGIC_VECTOR (15 downto 0);
       S0 : in STD_LOGIC;
       S1 : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (15 downto 0));

end B_input_logic;

architecture Behavioral of B_input_logic is

begin
    Y(0)<= (S0 and B(0)) or (S1 and (not B(0)));
    Y(1)<= (S0 and B(1)) or (S1 and ( not B(1)));
    Y(2)<= (S0 and B(2)) or (S1 and (not B(2)));
    Y(3)<= (S0 and B(3)) or (S1 and ( not B(3)));
    Y(4)<= (S0 and B(4)) or (S1 and (not B(4)));
    Y(5)<= (S0 and B(5)) or (S1 and ( not B(5)));
    Y(6)<= (S0 and B(6)) or (S1 and (not B(6)));
    Y(7)<= (S0 and B(7)) or (S1 and ( not B(7)));
    Y(8)<= (S0 and B(8)) or (S1 and (not B(8)));
    Y(9)<= (S0 and B(9)) or (S1 and ( not B(9)));
    Y(10)<= (S0 and B(10)) or (S1 and ( not B(10)));
    Y(11)<= (S0 and B(11)) or (S1 and ( not B(11)));
    Y(12)<= (S0 and B(12)) or (S1 and ( not B(12)));
    Y(13)<= (S0 and B(13)) or (S1 and ( not B(13)));
    Y(14)<= (S0 and B(14)) or (S1 and ( not B(14)));
    Y(15)<= (S0 and B(15)) or (S1 and ( not B(15)));
        
                   

end Behavioral;
