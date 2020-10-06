----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2019 16:22:36
-- Design Name: 
-- Module Name: function_unittb - Behavioral
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

entity function_unittb is
--  Port ( );
end function_unittb;

architecture Behavioral of function_unittb is
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

--signals
signal A,B,F: std_logic_vector (15 downto 0) := (others=>'0');
signal fs :std_logic_vector(4 downto 0):= (others=>'0');
signal N,V,Z,C :std_logic;
begin
uut: function_unit PORT MAP(
    A=>A,
    B=>B,
    F=>F,
    fs=>fs,
    N=>N,
    Z=>Z,
    C=>C,
    V=>V
);

stim_proc:process
    begin
        A<="1111000011110000";
        B<="0000111100001111";
        --g=a
        fs<="00000";
        wait for 5ns;
        --g=a+1
        fs<="00001";
        wait for 5ns;
        --g=a+b
        fs<="00010";
        wait for 5ns;
        --g=a+b+1
        fs<="00011";
        wait for 5ns;
        --g=a +!b
        fs<="00100";
        wait for 5ns;
        --g=a+!b+1
        fs<="00101";
        wait for 5ns;
        --g=a-1
        fs<="00110";
        wait for 5ns;
        --g=a
        fs<="00111";
        wait for 5ns;
        
        --a and b
        fs<="01000";
        wait for 5ns;
        --a or b
        fs<="01010";
        wait for 5ns;
        --a xor b
        fs<="01100";
        wait for 5ns;
        --not a
        fs<="01110";
        wait for 5ns;
        
        --g=b
        fs<="10000";
        wait for 5ns;
        --g= b shifter right
        fs<="10100";
        wait for 5ns;
        --g=b shifted left
        fs<="11000";
        wait for 5ns;
        
        
    end process;


end Behavioral;
