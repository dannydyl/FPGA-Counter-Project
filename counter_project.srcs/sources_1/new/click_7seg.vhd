-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/05/11 21:48:45
-- Design Name: 
-- Module Name: click_7seg - Behavioral
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

---------------------top entity----------------------------------
entity click_7seg is
    port(
        rst_bar : in std_logic;
        button : in std_logic;
        clk : in std_logic;
        an : out std_logic_vector(3 downto 0);  -- anode
        seg_display : out std_logic_vector(6 downto 0)
        );
end click_7seg;

architecture Behavioral of click_7seg is
signal clean_button : std_logic;
signal counter_value : std_logic_vector(2 downto 0);
signal display_value : std_logic_vector(6 downto 0);
begin
    -- debounce entity
    debounce : entity work.debounce_fsm
        port map(
            clk => clk,
            rst_bar => rst_bar,
            button => button,
            out_button => clean_button
            );
            
    -- adder entity
    adder : entity work.adder
        port map(
            rst_bar => rst_bar,
            increment => clean_button,
            sum => counter_value
            );
            
     --7 seg display entity
     display : entity work.hex_seven
        port map(
            hex => counter_value,
            seg_drive => display_value
            );
            
     seg_display <= display_value;
     
     an <= "0000";

end Behavioral;
