----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/05/12 01:32:03
-- Design Name: 
-- Module Name: hex_seven - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_seven is
    port(
        hex : in std_logic_vector(2 downto 0);
        seg_drive : out std_logic_vector(6 downto 0)
        );
end hex_seven;

architecture Behavioral of hex_seven is

begin
        with hex select
        seg_drive <=
            "0000001" when "000",  -- 0
            "1001111" when "001",  -- 1
            "0010010" when "010",  -- 2
            "0000110" when "011",  -- 3
            "1001100" when "100",  -- 4
            "0100100" when "101",  -- 5
            "0100000" when "110",  -- 6
            "0001111" when "111",  -- 7
--            "0000000" when "1000",  -- 8
--            "0000100" when "1001",  -- 9
--            "0000010" when "1010",  -- A
--            "1100000" when "1011",  -- b
--            "0110001" when "1100",  -- C
--            "1000010" when "1101",  -- d
--            "0110000" when "1110",  -- E
            "0111000" when others;  -- F

end Behavioral;
