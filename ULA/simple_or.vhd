----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:27:26 05/03/2016 
-- Design Name: 
-- Module Name:    simple_or - Behavioral 
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

entity simple_or is
    Port ( a : in  std_logic_vector(3 downto 0);
           b : in  std_logic_vector(3 downto 0);
           z : out  std_logic_vector(3 downto 0));
end simple_or;

architecture Behavioral of simple_or is

begin

	z <= (a or b);

end Behavioral;

