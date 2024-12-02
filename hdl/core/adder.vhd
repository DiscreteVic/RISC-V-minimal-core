library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    Port (
        RS1 : in STD_LOGIC_VECTOR(31 downto 0);
        RS2 : in STD_LOGIC_VECTOR(31 downto 0);
        RES : out STD_LOGIC_VECTOR(31 downto 0)
        );
end adder;

architecture Behavioral of adder is
begin

    RES <= std_logic_vector(unsigned(RS1) + unsigned(RS2));
end Behavioral;
