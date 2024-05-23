----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/05/12
-- Design Name: 
-- Module Name: tb_click_7seg - Testbench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for click_7seg
-- 
-- Dependencies: Assumes debounce_fsm, adder, and hex_seven are working as expected.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.all;

ENTITY click_7seg_tb IS
END click_7seg_tb;

ARCHITECTURE behavior OF click_7seg_tb IS 
    --Inputs
    signal rst_bar : std_logic := '0';
    signal button : std_logic := '0';
    signal clk : std_logic := '0';

    --Outputs
    signal seg_display : std_logic_vector(6 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: entity click_7seg PORT MAP (
          rst_bar => rst_bar,
          button => button,
          clk => clk,
          seg_display => seg_display
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin       
        -- hold reset state for 100 ns.
        rst_bar <= '0';
        button <= '0';
        wait for 10 ns;  
        
        rst_bar <= '1'; -- release reset
        wait for 50 ns; 
        


        -- simulate multiple presses
        for i in 1 to 9 loop
            button <= '1';
            wait for 12ms;
            button <= '0';
            wait for 12ms;
        end loop;

        wait;
    end process;

END behavior;
