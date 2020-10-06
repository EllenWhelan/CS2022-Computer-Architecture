----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2019 15:43:46
-- Design Name: 
-- Module Name: decoder3_8 - Behavioral
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

entity decoder3_8 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
end decoder3_8;

architecture Behavioral of decoder3_8 is

    begin
    Q0<=((not A0) and (not A1)and (not A2)) after 5ns;
    Q1<=((not A0)and (not A1)and A2) after 5ns;
    Q2<=((not A0)and A1 and(not A2)) after 5ns;
    Q3<=((not A0)and A1 and A2) after 5ns;
    Q4<=(A0 and (not A1) and(not A2)) after 5ns;
    Q5<=(A0 and (not A1) and A2) after 5ns;
    Q6<=(A0 and A1 and(not A2)) after 5ns;
    Q7<=(A0 and A1 and A2) after 5ns;


end Behavioral;
