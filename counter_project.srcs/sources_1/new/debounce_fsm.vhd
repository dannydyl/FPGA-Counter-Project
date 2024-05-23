----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/05/11 21:51:27
-- Design Name: 
-- Module Name: debounce_fsm - Behavioral
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

entity debounce_fsm is
    generic(
        debounce_delay : integer := 2**20-1
        );
    port(
    clk : in std_logic; -- system clokc
    rst_bar : in std_logic; -- asynchronous reset bar
    button : in std_logic;  -- physical button
    out_button : out std_logic  -- debounced button
    );
end debounce_fsm;

architecture FSM of debounce_fsm is
type state is (wait_for_0, wait_for_1, still_1, output_state);
signal present_state, next_state : state;
signal counter: integer range 0 to 3000000 := 0;

begin
    -- State transition process
    initial_state: process (clk, rst_bar)
    begin
        if rst_bar = '0' then
            present_state <= wait_for_0;
        elsif rising_edge(clk) then
            present_state <= next_state;
        end if;
    end process;
    
    -- Counter and state logic process
    counter_and_state: process (clk, rst_bar)
    begin
        if rst_bar = '0' then
            counter <= 0;
            next_state <= wait_for_0;
            
        elsif rising_edge(clk) then
            case present_state is
                when wait_for_0 =>
                    if button = '0' then
                        counter <= 0;
                        next_state <= wait_for_1;
                    else
                        next_state <= wait_for_0;
                    end if;
                    
                when wait_for_1 =>
                    if button = '1' then
                        if counter < debounce_delay then
                            counter <= counter + 1;
                            next_state <= wait_for_1;
                        else
                            next_state <= still_1;
                        end if;
                    else
                        next_state <= wait_for_1;
                    end if;
                    
                when still_1 =>
                    if button = '0' then
                        next_state <= wait_for_0;
                    else
                        next_state <= output_state;
                    end if;
                    
                when output_state =>
                    next_state <= wait_for_0;
                    
                when others => 
                    next_state <= wait_for_0;
            end case;
        end if;
    end process;

    -- Output process
    output_process: process (present_state)
    begin
        case present_state is
            when output_state => 
                out_button <= '1';
            when others => 
                out_button <= '0';
        end case;
    end process;

end FSM;
