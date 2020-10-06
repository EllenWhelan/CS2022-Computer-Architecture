----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 16:22:47
-- Design Name: 
-- Module Name: arithmetic_circuit - Behavioral
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

entity arithmetic_circuit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Cout : out STD_LOGIC;
           V: out std_logic;
           G : out STD_LOGIC_VECTOR (15 downto 0));
end arithmetic_circuit;

   
architecture Behavioral of arithmetic_circuit is
 
COMPONENT B_input_logic Port ( 
       B : in STD_LOGIC_VECTOR (15 downto 0);
       S0 : in STD_LOGIC;
       S1 : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;
COMPONENT ripple16_adder Port(
        B,A: in std_logic_vector(15 downto 0);
        C0: in std_logic;
        S: out std_logic_vector(15 downto 0);
        C16: out std_logic;
        V: out std_logic
        );
END COMPONENT;

signal y_adder : std_logic_vector(15 downto 0) := (others =>'0');

begin

    Binput_log: B_input_logic PORT MAP(
    B=>B,
    S0=>S0,
    S1=>S1,
    Y=>y_adder
    );
    
    parallel_adder: ripple16_adder PORT MAP(
    A=> A,
    B=> y_adder,
    C0=> Cin,
    S=>G,
    C16=>Cout,
    V=>V
    );


end Behavioral;
