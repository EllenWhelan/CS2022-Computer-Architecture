----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2018 01:01:14 PM
-- Design Name: 
-- Module Name: processor - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity processor is
    Port( reset, Clk : in std_logic;
            PC_val : out std_logic_vector(15 downto 0);
            instr : out std_logic_vector(15 downto 0));
end processor;

architecture Behavioral of processor is

    component data_path port (
     TD : in std_logic;
            TA: in std_logic;
            TB: in std_logic;
            DR: in std_logic_vector( 2 downto 0);
            SA: in std_logic_vector( 2 downto 0);
            SB: in std_logic_vector( 2 downto 0);
            MM, RW, MD, MB: in std_logic;
           FS: in std_logic_vector (4 downto 0);
            constant_in: in std_logic_vector (2 downto 0);
            PC_out : in STD_LOGIC_VECTOR (15 downto 0);
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
           --constant_in: in std_logic_vector (15 downto 0);
           clk: in std_logic;
           adr_out : out STD_LOGIC_VECTOR (15 downto 0);
           data_out : out STD_LOGIC_VECTOR (15 downto 0);
           V,C,Z,N: out std_logic);
    end component;
    
    component microprog_ctrl port (
        reset : in std_logic;
        Clk : in std_logic;
        VCNZ : in std_logic_vector(3 downto 0);
        instr_in : in std_logic_vector(15 downto 0);
        TDDR_out, TASA_out, TBSB_out : out std_logic_vector(3 downto 0);
        FS_out : out std_logic_vector(4 downto 0);
        MB_out, MD_out, MM_out, RW_out, MW_out : out std_logic;
        PC_out : out std_logic_vector(15 downto 0)
    );
    end component;

    component memory port (
         Clk : in std_logic;
        address : in std_logic_vector(15 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        MemWrite : in std_logic;
        read_data : out std_logic_vector(15 downto 0)
    );
    end component;
    
    signal DR, SA, SB : std_logic_vector(2 downto 0);
    signal VCNZ: std_logic_vector( 3 downto 0);
    signal FS : std_logic_vector(4 downto 0);
    signal PC, Adr, memdata_in, memdata_out : std_logic_vector(15 downto 0);
    signal RW, MB, MD, MM, MW, notMW , TD, TA, TB: std_logic;

begin

    
    dp : data_path port map (
        Clk => Clk,
        TD => TD,
        DR=>DR,
        TA => TA,
        SA=>SA,
        TB => TB,
        SB=>SB,
        FS => FS,
        PC_out => PC,
        Constant_in => SB,
        Data_in => memdata_out,
        RW => RW,
        MB => MB,
        MD => MD,
        MM => MM,
        Z => VCNZ(0),
        N => VCNZ(1),
        C => VCNZ(2),
        V => VCNZ(3),
        Data_out => memdata_in,
        Adr_out => Adr
    );
    
    ctrl : microprog_ctrl port map (
        reset => reset,
        Clk => Clk,
        VCNZ => VCNZ,
        instr_in => memdata_out,
        TDDR_out(3) => TD,
        TDDR_out(2 downto 0)=>DR,
        TASA_out(3) => TA,
        TASA_out(2 downto 0) => SA,
        TBSB_out(3) => TB,
        TBSB_out(2 downto 0)=>SB,
        FS_out => FS,
        MB_out => MB,
        MD_out => MD,
        MM_out => MM,
        RW_out => RW,
        MW_out => MW,
        PC_out => PC
    );
    
    notMW <= not MW;
    
    mem : memory port map (
         Clk=>clk,
        address=>adr,
        write_data=>memdata_in,
        MemWrite=>MW,
        read_data=>memdata_out
    );
    
    PC_val <= PC;
    instr <= memdata_out; 


end Behavioral;
