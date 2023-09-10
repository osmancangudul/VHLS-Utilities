-- ==============================================================
-- Generated by Vitis HLS v2023.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity debouncer is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    sw : IN STD_LOGIC_VECTOR (0 downto 0);
    out_r : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of debouncer is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "debouncer_debouncer,hls_ip_2023_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7s100-fgga676-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.743000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=67,HLS_SYN_LUT=278,HLS_VERSION=2023_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv64_1F4 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000111110100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_FFFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";

    signal state : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal previous_sw : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal counter : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000111110100";
    signal next_state_2_fu_105_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal out_tmp_1_fu_113_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal next_counter_2_fu_97_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln35_fu_65_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal next_counter_fu_71_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal next_counter_1_fu_77_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal next_state_fu_85_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal next_state_1_fu_91_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                counter <= next_counter_2_fu_97_p3;
                previous_sw <= out_tmp_1_fu_113_p3;
                state <= next_state_2_fu_105_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_ST_fsm_state1_blk <= ap_const_logic_0;
    icmp_ln35_fu_65_p2 <= "1" when (counter = ap_const_lv64_0) else "0";
    next_counter_1_fu_77_p3 <= 
        ap_const_lv64_1F4 when (icmp_ln35_fu_65_p2(0) = '1') else 
        next_counter_fu_71_p2;
    next_counter_2_fu_97_p3 <= 
        next_counter_1_fu_77_p3 when (state(0) = '1') else 
        ap_const_lv64_1F4;
    next_counter_fu_71_p2 <= std_logic_vector(unsigned(counter) + unsigned(ap_const_lv64_FFFFFFFFFFFFFFFF));
    next_state_1_fu_91_p2 <= (sw xor previous_sw);
    next_state_2_fu_105_p3 <= 
        next_state_fu_85_p2 when (state(0) = '1') else 
        next_state_1_fu_91_p2;
    next_state_fu_85_p2 <= (icmp_ln35_fu_65_p2 xor ap_const_lv1_1);
    out_r <= 
        previous_sw when (state(0) = '1') else 
        sw;
    out_tmp_1_fu_113_p3 <= 
        previous_sw when (state(0) = '1') else 
        sw;
end behav;