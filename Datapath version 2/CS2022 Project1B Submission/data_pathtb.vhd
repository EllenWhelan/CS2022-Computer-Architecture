----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2019 17:12:23
-- Design Name: 
-- Module Name: data_pathtb - Behavioral
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

entity data_pathtb is
--  Port ( );
end data_pathtb;

architecture Behavioral of data_pathtb is
COMPONENT data_path
 Port (    ctrl_word : in STD_LOGIC_VECTOR (16 downto 0);
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           constant_in: in std_logic_vector (15 downto 0);
           clk: in std_logic;
           adr_out : out STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           V,C,Z,N: out std_logic);
END COMPONENT;
--SIGNALS

signal ctrl_word : STD_LOGIC_VECTOR (16 downto 0):= (others =>'0');
signal data_in : STD_LOGIC_VECTOR (15 downto 0):= (others =>'0');
signal constant_in:  std_logic_vector (15 downto 0):= (others =>'0');
signal clk:  std_logic;
signal adr_out :  STD_LOGIC_VECTOR (15 downto 0):= (others =>'0');
signal data_out :  STD_LOGIC_VECTOR (15 downto 0):= (others =>'0');
signal V,C,Z,N:  std_logic;

begin
uut: data_path PORT MAP(
           ctrl_word =>ctrl_word,
           data_in =>data_in,
           constant_in=>constant_in,
           clk=>clk,
           adr_out =>adr_out,
           data_out =>data_out,
           V=>V,
           C=>C,
           Z=>Z,
           N=>N
);

stim_proc:process
    begin
    --as I have shown in the testbench for function unit that
    -- all the operations work I will not go through each comnination of FS
    constant_in<="0000000000000000";
    --write val to register 0
    data_in<="1111000011110000";
    
    --load is zero  g=a
    clk<='0';
    ctrl_word<="00000000000000010";
    wait for 5ns;
    clk<='1';
    ctrl_word<="00000000000000010";
    wait for 5ns;
    
    --load is 1 g=a
    clk<='0';
    ctrl_word<="00000000000000011";
    wait for 5ns;
    clk<='1';
    ctrl_word<="00000000000000011";
    wait for 5ns;
    
    --write val to reg 1
    data_in<="0000111100001111";
     --load is zero  g=a
    clk<='0';
    ctrl_word<="10000010000000010";
    wait for 5ns;
    clk<='1';
    ctrl_word<="10000010000000010";
    wait for 5ns;
    
    --load is 1 g=a
    clk<='0';
    ctrl_word<="10000010000000011";
    wait for 5ns;
    clk<='1';
    ctrl_word<="10000010000000011";
    wait for 5ns;
    
    --perform addition op between val in reg0 and reg1 and store it into reg2
    --load is 0 g=a+b
    clk<='0';
    ctrl_word<="01010000000001000";
    wait for 5ns;
    clk<='1';
    ctrl_word<="01010000000001000";
    wait for 5ns;
    
    --load is 1 g=a+b
     clk<='0';
    ctrl_word<="01010000000001001";
    wait for 5ns;
    clk<='1';
    ctrl_word<="01010000000001001";
    wait for 5ns;
    
    --output result
    --load 0
    clk<='0';
    ctrl_word<="00001001000000000";
    wait for 5ns;
    clk<='1';
    ctrl_word<="00001001000000000";
    --load 1
     clk<='0';
    ctrl_word<="00001001000000001";
    wait for 5ns;
    clk<='1';
    ctrl_word<="00001001000000001";
    
    --load valule into reg3 
    data_in<="1010101010101010";
    
    --load is zero  g=a
    clk<='0';
    ctrl_word<="11011011000000010";
    wait for 5ns;
    clk<='1';
    ctrl_word<="11011011000000010";
    wait for 5ns;
    
    --load is 1 g=a
    clk<='0';
    ctrl_word<="11011011000000011";
    wait for 5ns;
    clk<='1';
    ctrl_word<="11011011000000011";
    wait for 5ns;
    
    
    --perform shift operation on reg3 and store it in reg4 
     --load is zero  g=b shift right
    clk<='0';
    ctrl_word<="00111011001010000";
    wait for 5ns;
    clk<='1';
    ctrl_word<="00111011001010000";
    wait for 5ns;
    
    --load is 1 g=b shift right
    clk<='0';
   ctrl_word<="00111011001010001";
    wait for 5ns;
    clk<='1';
    ctrl_word<="00111011001010001";
    wait for 5ns;
    
    --output reg four to show shifted value
     --load is zero  g=a
    clk<='0';
    ctrl_word<="00100100100000000";
    wait for 5ns;
    clk<='1';
    ctrl_word<="00100100100000000";
    wait for 5ns;
    
    --load is 1 g=a
    clk<='0';
   ctrl_word<="00100100100000001";
    wait for 5ns;
    clk<='1';
   ctrl_word<="00100100100000001";
    wait for 5ns;
    
    end process;

end Behavioral;
