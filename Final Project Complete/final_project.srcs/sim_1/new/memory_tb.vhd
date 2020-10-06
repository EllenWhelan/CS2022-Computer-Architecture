----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 10:11:53 AM
-- Design Name: 
-- Module Name: memory_tb - Behavioral
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

entity memory_tb is
end memory_tb;

architecture Behavioral of memory_tb is

    COMPONENT memory PORT (
        Clk : in std_logic;
        address : in std_logic_vector(15 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        MemWrite : in std_logic;
        read_data : out std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    -- inputs
    signal Clk : std_logic := '0';
    signal address : std_logic_vector(15 downto 0);
    signal write_data : std_logic_vector(15 downto 0);
    signal MemWrite : std_logic;
    
    -- outputs
    signal read_data : std_logic_vector(15 downto 0);
    
    constant clk_period : time := 40 ns;

begin

    Clk <= not Clk after clk_period/2;

    uut : memory PORT MAP (
        Clk => Clk,
        address => address,
        write_data => write_data,
        MemWrite => MemWrite,
        read_data => read_data
    );
    
    stim_proc : process
    begin
    
    write_data <= X"1717";
    address <= X"0000";
    MemWrite <= '1';
    wait for clk_period;
    
    write_data <= X"1234";
    address <= X"0001";
    wait for clk_period;
    
    address <= X"0000";
    MemWrite <= '0';
    wait for clk_period;
    
    address <= X"0001";
    wait for clk_period;

    end process;

end Behavioral;
