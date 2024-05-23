----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/05/12 00:01:28
-- Design Name: 
-- Module Name: adder - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
    port(
        rst_bar : in std_logic; -- asychronous reset bar
        increment : in std_logic;   -- increment click from button
        sum : out std_logic_vector(2 downto 0)
        );
end adder;

architecture Behavioral of adder is
begin
    
    adder : process (increment, rst_bar)
    begin
        if rst_bar = '0' then
            sum <= "000";
        elsif rising_edge(increment) then
                sum <= std_logic_vector(1 + unsigned(sum));
                    if sum = "111" then
                        sum <= "000";
                    end if;
            end if;
    end process;
    
end Behavioral;
