----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:52:08 04/19/2016 
-- Design Name: 
-- Module Name:    ula - Behavioral 
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


entity ula is
    Port ( s : in std_logic_vector(2 downto 0);
           z : out  std_logic_vector(3 downto 0);
			  n : out  std_logic_vector(1 downto 0);
			  clk_in : in std_logic;
			  c : inout std_logic);
end ula;


architecture Behavioral of ula is

	type states is (S1, S2, S3);
	signal state : states;

	signal z_and, z_or: std_logic_vector(3 downto 0);
	signal clk : std_logic;
	signal sum : std_logic_vector(3 downto 0);
	signal v : std_logic;
	signal cin : std_logic := '0';
	signal A : std_logic_vector(3 downto 0) := "1100";
	signal B : std_logic_vector(3 downto 0) := "1111";	
	
	component simple_and is
		port (a, b: in std_logic_vector(3 downto 0);
		z: out std_logic_vector(3 downto 0));
	end component;
	
	component simple_or is
		port (a, b: in std_logic_vector(3 downto 0);
		z: out std_logic_vector(3 downto 0));
	end component;
	
	component clock is
		port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC);
	end component;
	
	component FOURBITADD is
		port (a, b: in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		sum: out std_logic_vector (3 downto 0);
		Cout, V: out std_logic);
	end component;

	begin
		--L0: simple_and port map (A, B, z_and);
		--L1: simple_or port map (A, B, z_or);
		
		C0: clock port map(clk_in, clk);
		
		X0 : FOURBITADD port map(A, B, cin, sum, carry, v);
		
		DFF_PROCESS: process(clk, s, c)

		begin
		
			if (clk'event and clk = '1') then
				case state is
				
					-- STATE WHEN FIRST INPUT IS ACTIVE
					-- N SHOULD BE "10"
					when S1 =>
						z <= A;
						n <= "01";
						state <= S2;
					
					-- STATE WHEN SECOND INPUT IS ACTIVE
					-- N SHOULD BE "01"
					when S2 =>
						z <= B;
						n <= "10";
						state <= S3;
					
					-- STATE WHEN RESULT IS ACTIVE
					-- N SHOULD BE "11"
					when S3 =>
						n <= "11";
						
						case s is
						
							-- LOGIC AND
							when "000" =>
								z <= A and B;
								
							-- LOGIC OR
							when "001" =>
								z <= A or B;
								
							-- LOGIC XOR
							when "010" =>
								z <= A xor B;
								
							-- LOGIC NAND
							when "011" =>
								z <= A nand B;
								
							-- LOGIC AND
							when "100" =>
								z <= A and B;
								
							-- LOGIC OR
							when "101" =>
								z <= A or B;
								
							-- LOGIC XOR
							when "110" =>
								z <= A xor B;
								
							-- LOGIC NAND
							when "111" =>
								z <= A nand B;
								
							when others =>
							z <= "0000";
						end case;
						
						state <= S1;
					
					-- DEFAULT STATE RETURNS TO FIRST STATE
					when others =>
						state <= S1;
						
				end case;
			end if;
			
		end process;
		
		
end Behavioral;

