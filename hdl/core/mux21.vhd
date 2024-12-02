library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux21 is
    Port (
        sel : in STD_LOGIC;
        DI1 : in STD_LOGIC_VECTOR(31 downto 0);
        DI2 : in STD_LOGIC_VECTOR(31 downto 0);
        DO : out STD_LOGIC_VECTOR(31 downto 0);
    );
end mux21;

architecture Behavioral of mux21 is   
begin

    process(sel)
    begin
        if sel = '0' then
            DO <= DI1;
        else
            DO <= DI2;
        end if;
    end process;


end Behavioral;
