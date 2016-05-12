----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:04:10 04/19/2016 
-- Design Name: 
-- Module Name:    simple_and - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- definition of a full adder
entity simple_and is
	port (a, b: in std_logic_vector(3 downto 0);
	z: out std_logic_vector(3 downto 0));
end simple_and;

architecture simple_and_behav of simple_and is
begin
	z <= (a and b);
end simple_and_behav;




