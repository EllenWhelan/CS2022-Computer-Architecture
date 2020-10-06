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
   Port ( 
            a: in std_logic_vector (3 downto 0);
            b: in std_logic_vector (3 downto 0);
        
        dec_A: in std_logic_vector (3 downto 0);
        --dec_A0: in std_logic; --decoder3_8
        --dec_A1: in std_logic;
        --dec_A2: in std_logic;
        clk: in std_logic ; --reg
        --data_src: in std_logic ;--mux2_16
        data: in std_logic_vector (15 downto 0);
        a_out: out std_logic_vector (15 downto 0);
        b_out: out std_logic_vector (15 downto 0);
        load_enable : in std_logic --write for and with dec output
        
        );
        
    END COMPONENT;
    
    --input signals
    signal a,b: std_logic_vector(3 downto 0);
    signal dec_A: std_logic_vector(3 downto 0);
    signal clk: std_logic :='0';
    signal data : std_logic_vector(15 downto 0) :=(others =>'0');
    signal load_enable: std_logic;
    --output signals
   signal a_out, b_out : std_logic_vector(15 downto 0);
   
   constant period: time :=20 ns;
   
    
begin
    clk<=not clk after period/2;
    
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
  
    load_enable <= '1';
    a <= "0010";
    b <= "0100";
    data <= X"AAAA";
    dec_A <= "0010";
    wait for 30 ns;
    
    data <= X"BBBB";
    dec_A <= "0100";
    wait for 30 ns;
    
    -- test extra register
    data <= X"9999";
    dec_A <= "1000";
    wait for 30 ns;
    
    b <= "1000";
    wait for 30 ns;

    end process;
   
   
   
     
   
    
    
end Behavioral;
