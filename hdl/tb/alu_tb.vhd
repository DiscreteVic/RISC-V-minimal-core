library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_tb is
-- Test bench no tiene puertos
end alu_tb;

architecture Behavioral of alu_tb is

    -- Component a probar
    component alu
        Port (
            op : in STD_LOGIC_VECTOR(3 downto 0);
            RS1 : in STD_LOGIC_VECTOR(31 downto 0);
            RS2 : in STD_LOGIC_VECTOR(31 downto 0);
            RES : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    -- Señales para conectar al DUT
    signal clk : STD_LOGIC := '0';
    signal op : STD_LOGIC_VECTOR(3 downto 0);
    signal RS1 : STD_LOGIC_VECTOR(31 downto 0);
    signal RS2 : STD_LOGIC_VECTOR(31 downto 0);
    signal RES : STD_LOGIC_VECTOR(31 downto 0);

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instancia del DUT
    uut: alu
        Port map (
            op => op,
            RS1 => RS1,
            RS2 => RS2,
            RES => RES
        );

    -- Proceso para generar el clock
    clk_process: process
    begin
        while true loop
            clk <= '1';
            wait for clk_period / 2;
            clk <= '0';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Proceso para realizar pruebas
    stim_proc: process
    begin
        -- Reset inicial
        RS1 <= X"12354567";
        RS2 <= X"07AC4D15";
        wait for clk_period;

        op <= "0000";
        wait for clk_period;

        op <= "0001";
        wait for clk_period;

        op <= "0010";
        wait for clk_period;

        op <= "0011";
        wait for clk_period;

        op <= "0100";
        wait for clk_period;

        op <= "0101";
        wait for clk_period;

        op <= "0110";
        wait for clk_period;

        op <= "0111";
        wait for clk_period;

        op <= "1000";
        wait for clk_period;

        op <= "1001";
        wait for clk_period;

        op <= "1010";
        wait for clk_period;

        op <= "1011";
        wait for clk_period;

        op <= "1100";
        wait for clk_period;

        op <= "1101";
        wait for clk_period;

        op <= "1110";
        wait for clk_period;

        op <= "1111";
        wait for clk_period;


        -- Finaliza simulación
        wait;
    end process;

end Behavioral;