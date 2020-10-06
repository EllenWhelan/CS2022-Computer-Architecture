----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2019 12:12:23
-- Design Name: 
-- Module Name: ripple16_adder - Behavioral
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

entity ripple16_adder is
    port(
        B,A: in std_logic_vector(15 downto 0);
        C0: in std_logic;
        S: out std_logic_vector(15 downto 0);
        C16: out std_logic;
        V: out std_logic
        );
end ripple16_adder;


architecture structural of ripple16_adder is
    COMPONENT full_adder
        port (
        x, y, z : in std_logic;
        s, c : out std_logic
        );
    END COMPONENT ;
    
    signal C: std_logic_vector(15 downto 1):=(others => '0');
    signal c_last :std_logic;
    
    begin
        Bit0: full_adder
            port map(
            x=> B(0),
            y=>A(0),
            z=>C0,
            s=>S(0),
            c=>C(1)
            );
        Bit1: full_adder
            port map(
            x=> B(1),
            y=>A(1),
            z=>C(1),
            s=>S(1),
            c=>C(2)
            );
        Bit2: full_adder
            port map(
            x=> B(2),
            y=>A(2),
            z=>C(2),
            s=>S(2),
            c=>C(3)
            );
        Bit3: full_adder
            port map(
            x=> B(3),
            y=>A(3),
            z=>C(3),
            s=>S(3),
            c=>C(4)
            );
        Bit4: full_adder
            port map(
            x=> B(4),
            y=>A(4),
            z=>C(4),
            s=>S(4),
            c=>C(5)
            );
        Bit5: full_adder
            port map(
            x=> B(5),
            y=>A(5),
            z=>C(5),
            s=>S(5),
            c=>C(6)
            );
        Bit6: full_adder
            port map(
            x=> B(6),
            y=>A(6),
            z=>C(6),
            s=>S(6),
            c=>C(7)
            );
        Bit7: full_adder
            port map(
            x=> B(7),
            y=>A(7),
            z=>C(7),
            s=>S(7),
            c=>C(8)
            );
        Bit8: full_adder
            port map(
            x=> B(8),
            y=>A(8),
            z=>C(8),
            s=>S(8),
            c=>C(9)
            );
        Bit9: full_adder
            port map(
            x=> B(9),
            y=>A(9),
            z=>C(9),
            s=>S(9),
            c=>C(10)
            );
        Bit10: full_adder
            port map(
            x=> B(10),
            y=>A(10),
            z=>C(10),
            s=>S(10),
            c=>C(11)
            );
        Bit11: full_adder
            port map(
            x=> B(11),
            y=>A(11),
            z=>C(11),
            s=>S(11),
            c=>C(12)
            );
        Bit12: full_adder
            port map(
            x=> B(12),
            y=>A(12),
            z=>C(12),
            s=>S(12),
            c=>C(13)
            );
        Bit13: full_adder
            port map(
            x=> B(13),
            y=>A(13),
            z=>C(13),
            s=>S(13),
            c=>C(14)
            );
        Bit14: full_adder
            port map(
            x=> B(14),
            y=>A(14),
            z=>C(14),
            s=>S(14),
            c=>C(15)
            );
        Bit15: full_adder
            port map(
            x=> B(15),
            y=>A(15),
            z=>C(15),
            s=>S(15),
            c=>c_last
            );
        --end structural;
        
-- 4-bit Adder: Behavioral Description
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;        
 ---   entity ripple16_adder_b is
 --       port(B, A : in std_logic_vector(3 downto 0);
  --      C0 : in std_logic;
       -- S : out std_logic_vector(3 downto 0);
     --   V: out std_logic;
   --     C16: out std_logic);
 --   end ripple16_adder_b;
    
 --architecture behavioural of ripple16_adder_b is
   -- signal sum:std_logic_vector(16 downto 0) := (others =>'0');
    
    --sum <= ('0' & A) + ('0' & B) + ("0000000000000000" & C0);
    C16 <= c_last;
    --S <= sum(15 downto 0);
    V<= c(15) xor c_last;

end structural;
