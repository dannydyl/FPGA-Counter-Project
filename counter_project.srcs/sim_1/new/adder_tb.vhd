----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/05/12 00:12:02
-- Design Name: 
-- Module Name: adder_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use work.all;

entity adder_tb is
-- Empty entity since this is a testbench
end adder_tb;

architecture tb of adder_tb is

    -- Signal Declarations
    signal rst_bar : std_logic := '1';
    signal increment : std_logic := '0';
    signal sum : std_logic_vector(2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: entity adder port map (
        rst_bar => rst_bar,
        increment => increment,
        sum => sum
    );



-- Test Stimuli
    stimulus : process
    begin
        -- Apply Reset
        rst_bar <= '0';
        wait for 30 ns;
        rst_bar <= '1';
        
        -- Test cycling through increments
        wait for 20 ns;  -- Let system stabilize
        for i in 0 to 9 loop  -- Increment 10 times to see the wrap around
            increment <= '1';
            wait for 1 ms;
            increment <= '0';
            wait for 2 ms; -- observe result after increment
        end loop;

        -- Finish simulation
        wait;
    end process;


end tb;
