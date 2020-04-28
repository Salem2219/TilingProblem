library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
  port(clk,rst, start, x1, x2, x3: in std_logic;
       wr1, wr2, wr3, sel, ld: out std_logic);
end ctrl;

architecture rtl of ctrl is
  type state_type is (s0,s1,s2,s3);
  signal current_state, next_state: state_type;
begin 
  process(x1, x2, x3, start, current_state)
  begin
    case current_state is
	when s0 =>  
	  wr1 <= '0';
	  wr2 <= '0';
	  wr3 <= '0';
    ld <= '0';      
    sel <= '0';      
	  next_state <= s1;
	when s1 =>  
	  wr1 <= '0';
	  wr2 <= '0';
	  wr3 <= '0';
    ld <= '1';      
    sel <= '0';
	  if (start = '1') then 
	    next_state <= s2 ;
	  else
	    next_state <= s1;	
	  end if;
	when s2 => 
	  wr1 <= '0';
	  wr2 <= '0';
	  wr3 <= '0';
    ld <= '0';      
    sel <= '0';
      if (x3 = '1') then
	  next_state <= s1;
      else
      next_state <= s3;
      end if;
	when s3 =>  
	  wr1 <= x1;
	  wr2 <= not(x1) and x2;
	  wr3 <= x1 nor x2;
    ld <= '1';      
    sel <= '1';
      next_state <= s2;
	end case;
  end process;
  process (rst, clk)
  begin
    if (rst ='1') then
      current_state <= s0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;
end rtl;