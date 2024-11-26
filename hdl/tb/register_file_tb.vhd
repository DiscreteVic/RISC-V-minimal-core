library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity register_file_tb is
-- Test bench no tiene puertos
end register_file_tb;

architecture Behavioral of register_file_tb is

    -- Component a probar
    component register_file
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
    end component;

    -- Señales para conectar al DUT
    signal clk : STD_LOGIC := '0';
    signal RD1, RD2 : STD_LOGIC_VECTOR(31 downto 0);
    signal RA1, RA2, WA : STD_LOGIC_VECTOR(4 downto 0);
    signal WD : STD_LOGIC_VECTOR(31 downto 0);
    signal WE : STD_LOGIC := '0';

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instancia del DUT
    uut: register_file
        Port map (
            clk => clk,
            RD1 => RD1,
            RD2 => RD2,
            RA1 => RA1,
            RA2 => RA2,
            WA => WA,
            WD => WD,
            WE => WE
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
        WE <= '0';
        RA1 <= "00000";
        RA2 <= "00000";
        WA <= "00000";
        WD <= X"00000000";
        wait for clk_period;

        -- Escribir en el registro 1
        WA <= "00001";
        WD <= X"12345678";
        WE <= '1';
        wait for clk_period;

        -- Leer desde el registro 1
        WE <= '0';
        RA1 <= "00001";
        wait for clk_period;

        -- Escribir en el registro 2
        WA <= "00010";
        WD <= X"87654321";
        WE <= '1';
        wait for clk_period;

        -- Leer desde el registro 2
        WE <= '0';
        RA2 <= "00010";
        wait for clk_period;

        -- Intentar leer registro 0 (debe devolver 0)
        RA1 <= "00000";
        wait for clk_period;

        -- Comprobar que cuando WA = RA1 RD1 lee el valor antiguo hasta el siguiente clock
        WA <= "11111";
        WD <= X"43215678";
        WE <= '1';
        wait for clk_period;

        WA <= "00000";
        WD <= X"00000000";
        WE <= '0';
        RA1 <= "11111";
        wait for clk_period;
        wait for clk_period;

        WA <= "11111";
        WD <= X"00000000";
        WE <= '1';
        wait for clk_period;

        WA <= "00000";
        WE <= '0';
        wait for clk_period;



        -- Finaliza simulación
        wait;
    end process;

end Behavioral;