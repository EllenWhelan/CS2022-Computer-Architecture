----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2019 11:29:38
-- Design Name: 
-- Module Name: mux81_tb - Behavioral
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

entity mux81_tb is
--  Port ( );
end mux81_tb;

architecture Behavioral of mux81_tb is
COMPONENT mux8_1 
    Port(
        N: in std_logic;
        Z: in std_logic;
        V: in std_logic;
        C: in std_logic;
        not_Z: in std_logic;
        not_C: in std_logic;
        zero: in std_logic;
        one: in std_logic;
        MS: in std_logic_vector(2 downto 0);
        muxS_out: out std_logic
    );
END COMPONENT;

--signals
signal N,Z,V,C, not_Z, not_C, zero, one: std_logic;
signal MS: std_logic_vector(2 downto 0):= (others=>'0');
signal muxS_out: std_logic;

begin
uut: mux8_1 port map(
    N=>N,
    Z=>Z,
    V=>V,
    C=>C,
    not_Z=>not_Z,
    not_C=>not_C,
    zero=>'0',
    one=>'1',
    MS=>MS,
    muxS_out=>muxS_out
);
stim_proc: process

begin
N<='0';
Z<='1';
V<='0';
C<='1';
not_Z<=not Z;
not_C<= not C;
zero<='0';
one<='1';

MS<="000";
wait for 5ns;
MS<="001";
wait for 5ns;
MS<="010";
wait for 5ns;
MS<="011";
wait for 5ns;
MS<="100";
wait for 5ns;
MS<="101";
wait for 5ns;
MS<="110";
wait for 5ns;
MS<="111";
wait for 5ns;



end process;

end Behavioral;
