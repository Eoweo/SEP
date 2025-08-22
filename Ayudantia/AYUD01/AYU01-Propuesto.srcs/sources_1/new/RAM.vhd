library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
    Port (
        address  : in  std_logic_vector(1 downto 0); -- SW0..1
        clk      : in  std_logic;                    -- clk
        enable   : in  std_logic;                    -- BTN0
        data_out : out std_logic_vector(3 downto 0);  -- LEDs
        data_in  : in  std_logic_vector(1 downto 0); -- SW0..1
        writeIn  : in  std_logic;
        clear    : in  std_logic;
        writeSel : in  std_logic
    );
end RAM;

architecture Behavioral of RAM is
    type ram_array is array (0 to 3) of std_logic_vector(3 downto 0);
    signal ram_data : ram_array := (
        "1010", "1111", "0011", "1001"
    );
begin
    process(clk)
        variable a : integer;
    begin
        if rising_edge(clk) then
            a := to_integer(unsigned(address));

            -- 1) Clear tiene prioridad
            if clear = '1' then
                ram_data(a) <= "0000";
                        
            -- 2) Escritura con mascara por mitades
            elsif writeIn = '1' then
                if writeSel = '1' then
                    ram_data(a)(3 downto 2) <= data_in;
                else
                    ram_data(a)(1 downto 0) <= data_in;
                
                end if;
                    
            end if;

            -- 3) Lectura 
            if enable = '1' then
                data_out <= ram_data(a);
            end if;
        end if;
    end process;
end Behavioral;
