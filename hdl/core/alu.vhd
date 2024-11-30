library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port (
        op : in STD_LOGIC_VECTOR(3 downto 0);
        RS1 : in STD_LOGIC_VECTOR(31 downto 0);
        RS2 : in STD_LOGIC_VECTOR(31 downto 0);
        RES : out STD_LOGIC_VECTOR(31 downto 0)
        );
end alu;

architecture Behavioral of alu is
begin

    process(op) 
    begin
        case op is
            when "0000" => -- AND
                RES <= RS1 and RS2;
            when "0001" => -- OR
                RES <= RS1 or RS2;
            when "0010" => -- add
                RES <= std_logic_vector(unsigned(RS1) + unsigned(RS2));
            when "0110" => -- subtract
                RES <= std_logic_vector(unsigned(RS1) - unsigned(RS2));
            when others =>
                RES <= (others => '0');
        end case;
    end process;

end Behavioral;
