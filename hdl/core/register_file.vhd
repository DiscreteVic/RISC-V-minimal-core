library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file is
    Port (
        clk : in STD_LOGIC;
        RD1 : out STD_LOGIC_VECTOR(31 downto 0);
        RD2 : out STD_LOGIC_VECTOR(31 downto 0);
        RA1 : in STD_LOGIC_VECTOR(4 downto 0);
        RA2 : in STD_LOGIC_VECTOR(4 downto 0);
        WA : in STD_LOGIC_VECTOR(4 downto 0);
        WD : in STD_LOGIC_VECTOR(31 downto 0);
        WE : in STD_LOGIC
    );
end register_file;

architecture Behavioral of register_file is

    type reg_array is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0); 
    signal registers : reg_array := (others => (others => '0'));           
    
begin

    process(clk)
    begin
        if rising_edge(clk) then
            -- Write register
            if WE = '1' and WA /= "00000" then
                registers(to_integer(unsigned(WA))) <= WD;
            end if;

            -- Read register 1
            if RA1 = "00000" then
                RD1 <= X"00000000";
            else
                RD1 <= registers(to_integer(unsigned(RA1)));
            end if;

            -- Read register 2
            if RA2 = "00000" then
                RD2 <= X"00000000";
            else
                RD2 <= registers(to_integer(unsigned(RA2)));
            end if;
        end if;
    end process;

end Behavioral;
