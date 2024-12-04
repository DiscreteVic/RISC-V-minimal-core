library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Imm_gen is
    Port (
        DI : in STD_LOGIC_VECTOR(31 downto 0);
        DO : out STD_LOGIC_VECTOR(63 downto 0);
    );
end Imm_gen;

architecture Behavioral of Imm_gen is   
    signal intr_type : in STD_LOGIC_VECTOR(1 downto 0);
begin

    intr_type = DI[6:4]; -- TO CHECK

    process(intr_type)
    begin
        case intr_type is
            when "01" => -- L Type
                DO[11:0] <= DI[31:20];
                DO[63:12] <= (others => '0');
            when "10" => -- S Type
                DO[4:0] <= DI[11:7];
                DO[11:5] <= DI[31:25];
                DO[63:12] <= (others => '0');
            when "11" => -- SB Type
                DO[0] <= (others => '0');
                DO[4:1] <= DI[11:8];
                DO[10:5] <= DI[30:25];
                DO[11] <= DI[7];
                DO[12] <= DI[31];
                DO[63:13] <= (others => '0');

            when others =>
                DO <= x"0000000000000000";
        end case;
    end process;


end Behavioral;
