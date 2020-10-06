library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAR is
    Port (
        loaded_adr : in std_logic_vector(7 downto 0);
        load_car : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        car_out : inout std_logic_vector(7 downto 0)
    );
end CAR;


architecture Behavioral of CAR is

begin

process(clk)

begin
    if reset = '1' then
        car_out <= X"C0";
    else
        if(rising_edge(clk)) then
            if load_car = '1' then
                car_out <= loaded_adr;
            else
                car_out <= car_out + 1 after 5 ns;
            end if;
        end if;
    end if;
end process;

end Behavioral;
