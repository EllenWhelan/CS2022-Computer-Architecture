----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2019 18:39:10
-- Design Name: 
-- Module Name: regfile_tb - Behavioral
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

entity regfile_tb is
--  Port ( );
end regfile_tb;

architecture Behavioral of regfile_tb is

    COMPONENT Reg_File
    PORT(
        a: in std_logic_vector (2 downto 0);
        b: in std_logic_vector (2 downto 0);
        dec_A: in std_logic_vector (2 downto 0);
        clk: in std_logic ; --r
        data: in std_logic_vector (15 downto 0);
        a_out: out std_logic_vector (15 downto 0);
        b_out: out std_logic_vector (15 downto 0);
        load_enable : in std_logic 
        );
    END COMPONENT;
    
    --input signals
    signal a,b: std_logic_vector(2 downto 0);
    signal dec_A: std_logic_vector(2 downto 0);
    signal clk: std_logic;
    signal data : std_logic_vector(15 downto 0) :=(others =>'0');
    signal load_enable: std_logic;
    --output signals
   signal a_out, b_out : std_logic_vector(15 downto 0);
    
begin
    uut: reg_file PORT MAP(
        a=>a,
        b=>b,
        dec_A=>dec_A,
  
        clk=>clk,
        data=>data,
        a_out=>a_out,
        b_out=>b_out,
        load_enable=>load_enable    
        );

stim_proc: process
begin
  
     
   --reg0
   data<= "1111111100000000";
   a<="000";
   b<="000";
   dec_A<="000";
   clk<='0';
   load_enable<='0';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   clk<='0';
   load_enable<='1';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   
   --reg1
   data <= "0000000011111111";
   a<="001";
   b<="001";
   dec_A<="001";
   clk<='0';
   load_enable<='0';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   clk<='0';
   load_enable<='1';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   
   --reg2
   data<= "1111000011110000";
   a<="010";
   b<="010";
   dec_A<="010";
   clk<='0';
   load_enable<='0';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   clk<='0';
   load_enable<='1';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   
   --reg3
   data <= "0000111100001111";
   a<="011";
   b<="011";
   dec_A<="011";
   clk<='0';
   load_enable<='0';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   clk<='0';
   load_enable<='1';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   
   --reg4
   data<= "1100110011001100";
   a<="100";
   b<="100";
   dec_A<="100";
   clk<='0';
   load_enable<='0';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   clk<='0';
   load_enable<='1';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   
   --reg5
   data <= "0011001100110011";
   a<="101";
   b<="101";
   dec_A<="101";
   clk<='0';
   load_enable<='0';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   clk<='0';
   load_enable<='1';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   
   --reg6
   data<= "1111111111111111";
   a<="110";
   b<="110";
   dec_A<="110";
   clk<='0';
   load_enable<='0';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   clk<='0';
   load_enable<='1';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   
    --reg7
   data <= "0000000000000000";
   a<="111";
   b<="111";
   dec_A<="111";
   clk<='0';
   load_enable<='0';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
   clk<='0';
   load_enable<='1';
   wait for 5ns;
   clk<='1';
   wait for 5ns;
    
   
     
   
    
    
  end process;
end Behavioral;
