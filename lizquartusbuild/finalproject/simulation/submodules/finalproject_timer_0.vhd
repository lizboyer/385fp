--Legal Notice: (C)2023 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity finalproject_timer_0 is 
        port (
              -- inputs:
                 signal address : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal chipselect : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal write_n : IN STD_LOGIC;
                 signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal irq : OUT STD_LOGIC;
                 signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity finalproject_timer_0;


architecture europa of finalproject_timer_0 is
                signal clk_en :  STD_LOGIC;
                signal control_continuous :  STD_LOGIC;
                signal control_interrupt_enable :  STD_LOGIC;
                signal control_register :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal control_wr_strobe :  STD_LOGIC;
                signal counter_is_running :  STD_LOGIC;
                signal counter_is_zero :  STD_LOGIC;
                signal counter_load_value :  STD_LOGIC_VECTOR (63 DOWNTO 0);
                signal counter_snapshot :  STD_LOGIC_VECTOR (63 DOWNTO 0);
                signal delayed_unxcounter_is_zeroxx0 :  STD_LOGIC;
                signal do_start_counter :  STD_LOGIC;
                signal do_stop_counter :  STD_LOGIC;
                signal force_reload :  STD_LOGIC;
                signal internal_counter :  STD_LOGIC_VECTOR (63 DOWNTO 0);
                signal period_halfword_0_register :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal period_halfword_0_wr_strobe :  STD_LOGIC;
                signal period_halfword_1_register :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal period_halfword_1_wr_strobe :  STD_LOGIC;
                signal period_halfword_2_register :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal period_halfword_2_wr_strobe :  STD_LOGIC;
                signal period_halfword_3_register :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal period_halfword_3_wr_strobe :  STD_LOGIC;
                signal read_mux_out :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal snap_halfword_0_wr_strobe :  STD_LOGIC;
                signal snap_halfword_1_wr_strobe :  STD_LOGIC;
                signal snap_halfword_2_wr_strobe :  STD_LOGIC;
                signal snap_halfword_3_wr_strobe :  STD_LOGIC;
                signal snap_read_value :  STD_LOGIC_VECTOR (63 DOWNTO 0);
                signal snap_strobe :  STD_LOGIC;
                signal start_strobe :  STD_LOGIC;
                signal status_wr_strobe :  STD_LOGIC;
                signal stop_strobe :  STD_LOGIC;
                signal timeout_event :  STD_LOGIC;
                signal timeout_occurred :  STD_LOGIC;

begin

  clk_en <= std_logic'('1');
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_counter <= std_logic_vector'("0000000000000000000000000000000000000000000000001100001101001111");
    elsif clk'event and clk = '1' then
      if std_logic'((counter_is_running OR force_reload)) = '1' then 
        if std_logic'((counter_is_zero OR force_reload)) = '1' then 
          internal_counter <= counter_load_value;
        else
          internal_counter <= A_EXT (((std_logic_vector'("0") & (internal_counter)) - std_logic_vector'("00000000000000000000000000000000000000000000000000000000000000001")), 64);
        end if;
      end if;
    end if;

  end process;

  counter_is_zero <= to_std_logic((internal_counter = std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000000")));
  counter_load_value <= period_halfword_3_register & period_halfword_2_register & period_halfword_1_register & period_halfword_0_register;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      force_reload <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        force_reload <= ((period_halfword_3_wr_strobe OR period_halfword_2_wr_strobe) OR period_halfword_1_wr_strobe) OR period_halfword_0_wr_strobe;
      end if;
    end if;

  end process;

  do_start_counter <= start_strobe;
  do_stop_counter <= ((stop_strobe) OR (force_reload)) OR ((counter_is_zero AND NOT control_continuous));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      counter_is_running <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(do_start_counter) = '1' then 
          counter_is_running <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
        elsif std_logic'(do_stop_counter) = '1' then 
          counter_is_running <= std_logic'('0');
        end if;
      end if;
    end if;

  end process;

  --delayed_unxcounter_is_zeroxx0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      delayed_unxcounter_is_zeroxx0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        delayed_unxcounter_is_zeroxx0 <= counter_is_zero;
      end if;
    end if;

  end process;

  timeout_event <= (counter_is_zero) AND NOT (delayed_unxcounter_is_zeroxx0);
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      timeout_occurred <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        if std_logic'(status_wr_strobe) = '1' then 
          timeout_occurred <= std_logic'('0');
        elsif std_logic'(timeout_event) = '1' then 
          timeout_occurred <= Vector_To_Std_Logic(-SIGNED(std_logic_vector'("00000000000000000000000000000001")));
        end if;
      end if;
    end if;

  end process;

  irq <= timeout_occurred AND control_interrupt_enable;
  --s1, which is an e_avalon_slave
  read_mux_out <= ((((((((((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000010")))), 16) AND period_halfword_0_register)) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000011")))), 16) AND period_halfword_1_register))) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000100")))), 16) AND period_halfword_2_register))) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000101")))), 16) AND period_halfword_3_register))) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000110")))), 16) AND snap_read_value(15 DOWNTO 0)))) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000111")))), 16) AND snap_read_value(31 DOWNTO 16)))) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000001000")))), 16) AND snap_read_value(47 DOWNTO 32)))) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000001001")))), 16) AND snap_read_value(63 DOWNTO 48)))) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000001")))), 16) AND (std_logic_vector'("000000000000") & (control_register))))) OR ((A_REP(to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000000")))), 16) AND (std_logic_vector'("00000000000000") & (Std_Logic_Vector'(A_ToStdLogicVector(counter_is_running) & A_ToStdLogicVector(timeout_occurred))))));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      readdata <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        readdata <= read_mux_out;
      end if;
    end if;

  end process;

  period_halfword_0_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000010"))));
  period_halfword_1_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000011"))));
  period_halfword_2_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000100"))));
  period_halfword_3_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000101"))));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      period_halfword_0_register <= std_logic_vector'("1100001101001111");
    elsif clk'event and clk = '1' then
      if std_logic'(period_halfword_0_wr_strobe) = '1' then 
        period_halfword_0_register <= writedata;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      period_halfword_1_register <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(period_halfword_1_wr_strobe) = '1' then 
        period_halfword_1_register <= writedata;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      period_halfword_2_register <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(period_halfword_2_wr_strobe) = '1' then 
        period_halfword_2_register <= writedata;
      end if;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      period_halfword_3_register <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(period_halfword_3_wr_strobe) = '1' then 
        period_halfword_3_register <= writedata;
      end if;
    end if;

  end process;

  snap_halfword_0_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000110"))));
  snap_halfword_1_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000111"))));
  snap_halfword_2_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000001000"))));
  snap_halfword_3_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000001001"))));
  snap_strobe <= ((snap_halfword_0_wr_strobe OR snap_halfword_1_wr_strobe) OR snap_halfword_2_wr_strobe) OR snap_halfword_3_wr_strobe;
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      counter_snapshot <= std_logic_vector'("0000000000000000000000000000000000000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(snap_strobe) = '1' then 
        counter_snapshot <= internal_counter;
      end if;
    end if;

  end process;

  snap_read_value <= counter_snapshot;
  control_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000001"))));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      control_register <= std_logic_vector'("0000");
    elsif clk'event and clk = '1' then
      if std_logic'(control_wr_strobe) = '1' then 
        control_register <= writedata(3 DOWNTO 0);
      end if;
    end if;

  end process;

  stop_strobe <= writedata(3) AND control_wr_strobe;
  start_strobe <= writedata(2) AND control_wr_strobe;
  control_continuous <= control_register(1);
  control_interrupt_enable <= control_register(0);
  status_wr_strobe <= (chipselect AND NOT write_n) AND to_std_logic((((std_logic_vector'("0000000000000000000000000000") & (address)) = std_logic_vector'("00000000000000000000000000000000"))));

end europa;

