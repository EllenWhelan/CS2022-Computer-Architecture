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
        src_s0: in std_logic; --mux8_16
        src_s1: in std_logic;
        src_s2: in std_logic;
        dec_A0: in std_logic; --decoder3_8
        dec_A1: in std_logic;
        dec_A2: in std_logic;
        clk: in std_logic ; --reg
        data_src: in std_logic ;--mux2_16
        data: in std_logic_vector (15 downto 0); 
        
        reg0: out std_logic_vector (15 downto 0); --register outouts
        reg1: out std_logic_vector (15 downto 0); --register outouts
        reg2: out std_logic_vector (15 downto 0); --register outouts
        reg3: out std_logic_vector (15 downto 0); --register outouts
        reg4: out std_logic_vector (15 downto 0); --register outouts
        reg5: out std_logic_vector (15 downto 0); --register outouts
        reg6: out std_logic_vector (15 downto 0); --register outouts
        reg7: out std_logic_vector (15 downto 0) --register outouts
        );
    END COMPONENT;
    
    --input signals
    signal src_s0, src_s1, src_s2, dec_A0, dec_A1, dec_A2, clk, data_src: std_logic;
    signal data : std_logic_vector(15 downto 0) :=(others =>'0');
    --output signals
    signal reg0,reg1, reg2, reg3, reg4, reg5, reg6, reg7: std_logic_vector(15 downto 0):=(others=>'0');
    
begin
    uut: reg_file PORT MAP(
        src_S0=>src_S0,
        src_S1=>src_S1,
        src_S2=>src_S2,
        dec_A0=>dec_A0,
        dec_A1=>dec_A1,
        dec_A2=>dec_A2,
        clk=>clk,
        data_src=>data_src,
        data=>data,
        reg0=>reg0,
        reg1=>reg1,
        reg2=>reg2,
        reg3=>reg3,
        reg4=>reg4,
        reg6=>reg6,
        reg7=>reg7,
        reg5=>reg5
        );

stim_proc: process
begin
    --loading into each register
    src_s0<='0';
    src_s1<='0';
    src_s2<='0';
    
    data_src<='0';
    data<="1111111111111111";
    
    --load in to reg0
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='0'; --should do something to reg0
    clk<='0'; 
    data<="0000111100001111";
    wait for 10ns;
    
    clk<='1';
    wait for 10ns;
    
    --put cntents register 
    data_src<='1'; 
    --put contents reg0 in reg1-7
    src_S0<='0';
    src_S1<='0';
    src_S2<='0';
    --r1
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r2
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r3
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r4
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r5
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r6
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r7
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    
    
    
    
    --load into r1
    src_s0<='0';
    src_s1<='0';
    src_s2<='0';
    
    data_src<='0';
     dec_A0<='0';
    dec_A1<='0';
    dec_A2<='1'; --should do something to reg1
    clk<='0';
    data<="1111000011110000";
    wait for 10ns;
    
    clk<='1';
    wait for 10ns;
     --put contents r1 into r0,r2-r7
    --put contents reg0 in reg1-7
    src_S0<='0';
    src_S1<='0';
    src_S2<='1';
    --r0
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r2
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r3
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r4
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r5
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r6
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r7
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    
    --load into reg2
     src_s0<='0';
    src_s1<='0';
    src_s2<='0';
    
    data_src<='0';
     dec_A0<='0';
    dec_A1<='1';
    dec_A2<='0'; --should do something to reg2
    clk<='0';
    data<="1111111100000000";
    wait for 10ns;
    
    clk<='1';
    wait for 10ns;
    
    --put contents r2 into r0-1,3-7
        src_S0<='0';
    src_S1<='1';
    src_S2<='0';
    --r0
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r1
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r3
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r4
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r5
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r6
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r7
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --load into reg 3
     src_s0<='0';
    src_s1<='0';
    src_s2<='0';
    
    data_src<='0';
     dec_A0<='0';
    dec_A1<='1';
    dec_A2<='1'; --should do something to reg3
    clk<='0';
    data<="0000000011111111";
    wait for 10ns;
    
    clk<='1';
    wait for 10ns;
    --put contents r3 into r0-2, 4-7
    src_S0<='0';
    src_S1<='1';
    src_S2<='1';
    --r0
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r1
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r2
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r4
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r5
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r6
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r7
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    
    
    --load into reg4
     src_s0<='0';
    src_s1<='0';
    src_s2<='0';
    
    data_src<='0';
     dec_A0<='1';
    dec_A1<='0';
    dec_A2<='0'; --should do something to reg4
    clk<='0';
    data<="1100110011001100";
    wait for 10ns;
    
    clk<='1';
    wait for 10ns;
    
    --put contenst r4 into r0-3,5-7
    src_S0<='1';
    src_S1<='0';
    src_S2<='0';
    --r0
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
     --r1
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r2
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r3
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
 
    --r5
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r6
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r7
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    
    --load into reg 5
     src_s0<='0';
    src_s1<='0';
    src_s2<='0';
    
    data_src<='0';
     dec_A0<='1';
    dec_A1<='0';
    dec_A2<='1'; --should do something to reg5
    clk<='0';
    data<="0011001100110011";
    wait for 10ns;
    
    clk<='1';
    wait for 10ns;
    
    --put contents r5 into r0-4,6-7
      src_S0<='1';
    src_S1<='0';
    src_S2<='1';
    --r0
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
     --r1
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r2
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r3
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
 
    --r4
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r6
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r7
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    
    --load into reg 6
     src_s0<='0';
    src_s1<='0';
    src_s2<='0';
    
    data_src<='0';
     dec_A0<='1';
    dec_A1<='1';
    dec_A2<='0'; --should do something to reg6
    clk<='0';
    data<="0101010101010101";
    wait for 10ns;
    
    clk<='1';
    wait for 10ns;
    
    --put contents r6 into r0-5,7
      src_S0<='1';
    src_S1<='1';
    src_S2<='0';
    --r0
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
     --r1
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r2
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r3
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
 
    --r4
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r5
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r7
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    
    --load into reg 7
     src_s0<='0';
    src_s1<='0';
    src_s2<='0';
    
    data_src<='0';
     dec_A0<='1';
    dec_A1<='1';
    dec_A2<='1'; --should do something to reg7
    clk<='0';
    data<="1010101010101010";
    wait for 10ns;
    
    clk<='1';
    wait for 10ns;
    
    --put contents r7 into r0-6
      src_S0<='1';
    src_S1<='0';
    src_S2<='0';
    --r0
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
     --r1
    dec_A0<='0';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r2
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r3
    dec_A0<='0';
    dec_A1<='1';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r4
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r5
    dec_A0<='1';
    dec_A1<='0';
    dec_A2<='1';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    --r6
    dec_A0<='1';
    dec_A1<='1';
    dec_A2<='0';
    clk<='0';
    wait for 10 ns;
    clk<='1';
    wait for 10ns;
    

end process;
end Behavioral;
