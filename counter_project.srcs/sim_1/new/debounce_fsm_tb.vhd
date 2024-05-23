----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/05/11 21:51:27
-- Design Name: 
-- Module Name: debounce_fsm_tb - Behavioral
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
use work.all;

entity debounce_fsm_tb is
end debounce_fsm_tb;

architecture Behavioral of debounce_fsm_tb is
    signal clk : std_logic := '0';
    signal rst_bar : std_logic;
    signal button : std_logic;
    signal out_button : std_logic;
    
    constant clk_period : time := 10 ns;
    constant debounce_delay : integer := 30000;    
begin
    uut: entity work.debounce_fsm
        port map (
            clk => clk,
            rst_bar => rst_bar,
            button => button,
            out_button => out_button
        );

    clk_process : process
    begin
        while True loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    stim_proc: process
    begin
        rst_bar <= '0';
        button <= '0';
        wait for 1 ms;
        
        rst_bar <= '1';
        wait for 1ms;

        button <= '1';
        wait for 13 ms;

        button <= '0';
        wait for 20 ms;
        
        wait;
    end process;

end Behavioral;

