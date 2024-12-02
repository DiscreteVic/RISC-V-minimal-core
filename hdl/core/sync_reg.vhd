library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sync_reg is
    Port (
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;
        DI : in STD_LOGIC_VECTOR(31 downto 0)
        DO : out STD_LOGIC_VECTOR(31 downto 0)
        );
end sync_reg;

architecture Behavioral of sync_reg is
    signal sReg : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');           
begin

    process(clk, rst)
    begin
        if rising_edge(rst) then
            sReg <= (others => '0');
        end if;
        if rising_edge(clk) and rst = '0' then
            sReg <= DI;
        end if;
    end process;

    DO <= sReg;

end Behavioral;
