// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Apr  5 16:13:33 2019
// Host        : DESKTOP-BKSDDJC running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/gyx_uni/2_spring/cod/lab/lab3/lab3_3/lab3_3.sim/sim_1/synth/func/xsim/FIFO_tb_func_synth.v
// Design      : FIFO
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module FIFO
   (en_out,
    en_in,
    rst,
    clk_in,
    in,
    out,
    display,
    empty,
    full);
  input en_out;
  input en_in;
  input rst;
  input clk_in;
  input [3:0]in;
  output [3:0]out;
  output [15:0]display;
  output empty;
  output full;

  wire Q;
  wire Q_BUFG;
  wire [2:0]addr_dis;
  wire \addr_dis[2]_i_1_n_0 ;
  wire [2:0]addr_in;
  wire \addr_in[0]_i_1_n_0 ;
  wire \addr_in[1]_i_1_n_0 ;
  wire \addr_in[2]_i_1_n_0 ;
  wire [2:0]addr_out;
  wire clk_5mhz;
  wire clk_in;
  wire \count[1]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire [3:0]count_reg__0;
  wire [0:0]data;
  wire de_queue_able;
  wire [15:0]display;
  wire [15:0]display_OBUF;
  wire \display_OBUF[7]_inst_i_2_n_0 ;
  wire \display_OBUF[7]_inst_i_3_n_0 ;
  wire \display_OBUF[7]_inst_i_4_n_0 ;
  wire empty;
  wire empty_OBUF;
  wire en_in;
  wire en_in_IBUF;
  wire en_out;
  wire en_out_IBUF;
  wire en_queue_able;
  wire \flag_in[0]_i_1_n_0 ;
  wire \flag_in[1]_i_1_n_0 ;
  wire \flag_out[0]_i_1_n_0 ;
  wire \flag_out[1]_i_1_n_0 ;
  wire full;
  wire full_OBUF;
  wire head;
  wire \head[0]_i_1_n_0 ;
  wire \head[1]_i_1_n_0 ;
  wire \head[2]_i_2_n_0 ;
  wire \head_reg_n_0_[0] ;
  wire \head_reg_n_0_[1] ;
  wire \head_reg_n_0_[2] ;
  wire [3:0]in;
  wire [3:0]in_IBUF;
  wire [3:0]out;
  wire [3:0]out_OBUF;
  wire [1:0]p_0_in;
  wire [1:0]p_0_in__0;
  wire [1:0]p_0_in__1;
  wire [3:2]p_0_in__2;
  wire rst;
  wire rst_IBUF;
  wire [7:0]used;
  wire [2:2]used1;
  wire \used[0]_i_1_n_0 ;
  wire \used[0]_i_2_n_0 ;
  wire \used[1]_i_1_n_0 ;
  wire \used[1]_i_2_n_0 ;
  wire \used[2]_i_1_n_0 ;
  wire \used[2]_i_2_n_0 ;
  wire \used[3]_i_1_n_0 ;
  wire \used[3]_i_2_n_0 ;
  wire \used[4]_i_1_n_0 ;
  wire \used[4]_i_2_n_0 ;
  wire \used[4]_i_3_n_0 ;
  wire \used[5]_i_1_n_0 ;
  wire \used[5]_i_2_n_0 ;
  wire \used[5]_i_3_n_0 ;
  wire \used[6]_i_1_n_0 ;
  wire \used[6]_i_2_n_0 ;
  wire \used[6]_i_3_n_0 ;
  wire \used[7]_i_1_n_0 ;
  wire \used[7]_i_2_n_0 ;
  wire \used[7]_i_4_n_0 ;
  wire NLW_U1_locked_UNCONNECTED;

  BUFG Q_BUFG_inst
       (.I(Q),
        .O(Q_BUFG));
  clk_wiz_0 U1
       (.clk_in1(clk_in),
        .clk_out1(clk_5mhz),
        .locked(NLW_U1_locked_UNCONNECTED),
        .reset(1'b0));
  clock_500hz U2
       (.Q(Q),
        .clk_out1(clk_5mhz));
  Reg_File U4
       (.D(in_IBUF),
        .Q(p_0_in[0]),
        .Q_BUFG(Q_BUFG),
        .\addr_dis_reg[2] (addr_dis),
        .addr_in(addr_in),
        .\addr_out_reg[2] (addr_out),
        .\count_reg[3] (count_reg__0),
        .display_OBUF(display_OBUF[14:8]),
        .en_queue_able(en_queue_able),
        .out_OBUF(out_OBUF),
        .rst_IBUF(rst_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \addr_dis[0]_i_1 
       (.I0(addr_dis[0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addr_dis[1]_i_1 
       (.I0(addr_dis[0]),
        .I1(addr_dis[1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \addr_dis[2]_i_1 
       (.I0(addr_dis[1]),
        .I1(addr_dis[0]),
        .I2(addr_dis[2]),
        .O(\addr_dis[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \addr_dis_reg[0] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(p_0_in__1[0]),
        .Q(addr_dis[0]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_dis_reg[1] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(p_0_in__1[1]),
        .Q(addr_dis[1]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_dis_reg[2] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\addr_dis[2]_i_1_n_0 ),
        .Q(addr_dis[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    \addr_in[0]_i_1 
       (.I0(count_reg__0[0]),
        .I1(\head_reg_n_0_[0] ),
        .I2(en_queue_able),
        .I3(addr_in[0]),
        .O(\addr_in[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9666FFFF96660000)) 
    \addr_in[1]_i_1 
       (.I0(\head_reg_n_0_[1] ),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(\head_reg_n_0_[0] ),
        .I4(en_queue_able),
        .I5(addr_in[1]),
        .O(\addr_in[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \addr_in[2]_i_1 
       (.I0(used1),
        .I1(en_queue_able),
        .I2(addr_in[2]),
        .O(\addr_in[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEC80137F137FEC80)) 
    \addr_in[2]_i_2 
       (.I0(\head_reg_n_0_[0] ),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[0]),
        .I3(\head_reg_n_0_[1] ),
        .I4(\head_reg_n_0_[2] ),
        .I5(count_reg__0[2]),
        .O(used1));
  FDCE #(
    .INIT(1'b0)) 
    \addr_in_reg[0] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\addr_in[0]_i_1_n_0 ),
        .Q(addr_in[0]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_in_reg[1] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\addr_in[1]_i_1_n_0 ),
        .Q(addr_in[1]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_in_reg[2] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\addr_in[2]_i_1_n_0 ),
        .Q(addr_in[2]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_out_reg[0] 
       (.C(Q_BUFG),
        .CE(head),
        .CLR(rst_IBUF),
        .D(\head_reg_n_0_[0] ),
        .Q(addr_out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_out_reg[1] 
       (.C(Q_BUFG),
        .CE(head),
        .CLR(rst_IBUF),
        .D(\head_reg_n_0_[1] ),
        .Q(addr_out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \addr_out_reg[2] 
       (.C(Q_BUFG),
        .CE(head),
        .CLR(rst_IBUF),
        .D(\head_reg_n_0_[2] ),
        .Q(addr_out[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count_reg__0[0]),
        .O(data));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h0FF0F04F)) 
    \count[1]_i_1 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[3]),
        .I2(p_0_in[0]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[0]),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h77EE8831)) 
    \count[2]_i_1 
       (.I0(p_0_in[0]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[2]),
        .O(p_0_in__2[2]));
  LUT6 #(
    .INIT(64'hFFFFFEFFAAAAAAA8)) 
    \count[3]_i_1 
       (.I0(p_0_in__0[0]),
        .I1(count_reg__0[2]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .I4(count_reg__0[0]),
        .I5(p_0_in[0]),
        .O(\count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h78F0F0C1)) 
    \count[3]_i_2 
       (.I0(p_0_in[0]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[1]),
        .I4(count_reg__0[2]),
        .O(p_0_in__2[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(Q_BUFG),
        .CE(\count[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(data),
        .Q(count_reg__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(Q_BUFG),
        .CE(\count[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(\count[1]_i_1_n_0 ),
        .Q(count_reg__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(Q_BUFG),
        .CE(\count[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(p_0_in__2[2]),
        .Q(count_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(Q_BUFG),
        .CE(\count[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(p_0_in__2[3]),
        .Q(count_reg__0[3]));
  OBUF \display_OBUF[0]_inst 
       (.I(display_OBUF[0]),
        .O(display[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    \display_OBUF[0]_inst_i_1 
       (.I0(addr_dis[0]),
        .I1(addr_dis[2]),
        .I2(addr_dis[1]),
        .I3(\display_OBUF[7]_inst_i_2_n_0 ),
        .O(display_OBUF[0]));
  OBUF \display_OBUF[10]_inst 
       (.I(display_OBUF[10]),
        .O(display[10]));
  OBUF \display_OBUF[11]_inst 
       (.I(display_OBUF[11]),
        .O(display[11]));
  OBUF \display_OBUF[12]_inst 
       (.I(display_OBUF[12]),
        .O(display[12]));
  OBUF \display_OBUF[13]_inst 
       (.I(display_OBUF[13]),
        .O(display[13]));
  OBUF \display_OBUF[14]_inst 
       (.I(display_OBUF[14]),
        .O(display[14]));
  OBUF \display_OBUF[15]_inst 
       (.I(display_OBUF[15]),
        .O(display[15]));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \display_OBUF[15]_inst_i_1 
       (.I0(addr_dis[0]),
        .I1(\head_reg_n_0_[0] ),
        .I2(\head_reg_n_0_[2] ),
        .I3(addr_dis[2]),
        .I4(\head_reg_n_0_[1] ),
        .I5(addr_dis[1]),
        .O(display_OBUF[15]));
  OBUF \display_OBUF[1]_inst 
       (.I(display_OBUF[1]),
        .O(display[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \display_OBUF[1]_inst_i_1 
       (.I0(addr_dis[0]),
        .I1(addr_dis[2]),
        .I2(addr_dis[1]),
        .I3(\display_OBUF[7]_inst_i_2_n_0 ),
        .O(display_OBUF[1]));
  OBUF \display_OBUF[2]_inst 
       (.I(display_OBUF[2]),
        .O(display[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \display_OBUF[2]_inst_i_1 
       (.I0(addr_dis[1]),
        .I1(addr_dis[0]),
        .I2(addr_dis[2]),
        .I3(\display_OBUF[7]_inst_i_2_n_0 ),
        .O(display_OBUF[2]));
  OBUF \display_OBUF[3]_inst 
       (.I(display_OBUF[3]),
        .O(display[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hBFFF)) 
    \display_OBUF[3]_inst_i_1 
       (.I0(addr_dis[2]),
        .I1(addr_dis[0]),
        .I2(addr_dis[1]),
        .I3(\display_OBUF[7]_inst_i_2_n_0 ),
        .O(display_OBUF[3]));
  OBUF \display_OBUF[4]_inst 
       (.I(display_OBUF[4]),
        .O(display[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFDFF)) 
    \display_OBUF[4]_inst_i_1 
       (.I0(addr_dis[2]),
        .I1(addr_dis[0]),
        .I2(addr_dis[1]),
        .I3(\display_OBUF[7]_inst_i_2_n_0 ),
        .O(display_OBUF[4]));
  OBUF \display_OBUF[5]_inst 
       (.I(display_OBUF[5]),
        .O(display[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hBFFF)) 
    \display_OBUF[5]_inst_i_1 
       (.I0(addr_dis[1]),
        .I1(addr_dis[0]),
        .I2(addr_dis[2]),
        .I3(\display_OBUF[7]_inst_i_2_n_0 ),
        .O(display_OBUF[5]));
  OBUF \display_OBUF[6]_inst 
       (.I(display_OBUF[6]),
        .O(display[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hBFFF)) 
    \display_OBUF[6]_inst_i_1 
       (.I0(addr_dis[0]),
        .I1(addr_dis[2]),
        .I2(addr_dis[1]),
        .I3(\display_OBUF[7]_inst_i_2_n_0 ),
        .O(display_OBUF[6]));
  OBUF \display_OBUF[7]_inst 
       (.I(display_OBUF[7]),
        .O(display[7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \display_OBUF[7]_inst_i_1 
       (.I0(addr_dis[1]),
        .I1(addr_dis[0]),
        .I2(addr_dis[2]),
        .I3(\display_OBUF[7]_inst_i_2_n_0 ),
        .O(display_OBUF[7]));
  MUXF7 \display_OBUF[7]_inst_i_2 
       (.I0(\display_OBUF[7]_inst_i_3_n_0 ),
        .I1(\display_OBUF[7]_inst_i_4_n_0 ),
        .O(\display_OBUF[7]_inst_i_2_n_0 ),
        .S(addr_dis[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[7]_inst_i_3 
       (.I0(used[3]),
        .I1(used[2]),
        .I2(addr_dis[1]),
        .I3(used[1]),
        .I4(addr_dis[0]),
        .I5(used[0]),
        .O(\display_OBUF[7]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[7]_inst_i_4 
       (.I0(used[7]),
        .I1(used[6]),
        .I2(addr_dis[1]),
        .I3(used[5]),
        .I4(addr_dis[0]),
        .I5(used[4]),
        .O(\display_OBUF[7]_inst_i_4_n_0 ));
  OBUF \display_OBUF[8]_inst 
       (.I(display_OBUF[8]),
        .O(display[8]));
  OBUF \display_OBUF[9]_inst 
       (.I(display_OBUF[9]),
        .O(display[9]));
  OBUF empty_OBUF_inst
       (.I(empty_OBUF),
        .O(empty));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    empty_OBUF_inst_i_1
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[0]),
        .O(empty_OBUF));
  IBUF en_in_IBUF_inst
       (.I(en_in),
        .O(en_in_IBUF));
  IBUF en_out_IBUF_inst
       (.I(en_out),
        .O(en_out_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \flag_in[0]_i_1 
       (.I0(en_in_IBUF),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .O(\flag_in[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \flag_in[1]_i_1 
       (.I0(en_in_IBUF),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .O(\flag_in[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \flag_in_reg[0] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\flag_in[0]_i_1_n_0 ),
        .Q(p_0_in[0]));
  FDCE #(
    .INIT(1'b0)) 
    \flag_in_reg[1] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\flag_in[1]_i_1_n_0 ),
        .Q(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \flag_out[0]_i_1 
       (.I0(en_out_IBUF),
        .I1(p_0_in__0[1]),
        .I2(p_0_in__0[0]),
        .O(\flag_out[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \flag_out[1]_i_1 
       (.I0(en_out_IBUF),
        .I1(p_0_in__0[1]),
        .I2(p_0_in__0[0]),
        .O(\flag_out[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \flag_out_reg[0] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\flag_out[0]_i_1_n_0 ),
        .Q(p_0_in__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \flag_out_reg[1] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\flag_out[1]_i_1_n_0 ),
        .Q(p_0_in__0[1]));
  OBUF full_OBUF_inst
       (.I(full_OBUF),
        .O(full));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    full_OBUF_inst_i_1
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[0]),
        .O(full_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \head[0]_i_1 
       (.I0(\head_reg_n_0_[0] ),
        .O(\head[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \head[1]_i_1 
       (.I0(\head_reg_n_0_[0] ),
        .I1(\head_reg_n_0_[1] ),
        .O(\head[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000200AAAAAAA8)) 
    \head[2]_i_1 
       (.I0(p_0_in__0[0]),
        .I1(count_reg__0[2]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .I4(count_reg__0[0]),
        .I5(p_0_in[0]),
        .O(head));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \head[2]_i_2 
       (.I0(\head_reg_n_0_[0] ),
        .I1(\head_reg_n_0_[1] ),
        .I2(\head_reg_n_0_[2] ),
        .O(\head[2]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \head_reg[0] 
       (.C(Q_BUFG),
        .CE(head),
        .CLR(rst_IBUF),
        .D(\head[0]_i_1_n_0 ),
        .Q(\head_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \head_reg[1] 
       (.C(Q_BUFG),
        .CE(head),
        .CLR(rst_IBUF),
        .D(\head[1]_i_1_n_0 ),
        .Q(\head_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \head_reg[2] 
       (.C(Q_BUFG),
        .CE(head),
        .CLR(rst_IBUF),
        .D(\head[2]_i_2_n_0 ),
        .Q(\head_reg_n_0_[2] ));
  IBUF \in_IBUF[0]_inst 
       (.I(in[0]),
        .O(in_IBUF[0]));
  IBUF \in_IBUF[1]_inst 
       (.I(in[1]),
        .O(in_IBUF[1]));
  IBUF \in_IBUF[2]_inst 
       (.I(in[2]),
        .O(in_IBUF[2]));
  IBUF \in_IBUF[3]_inst 
       (.I(in[3]),
        .O(in_IBUF[3]));
  OBUF \out_OBUF[0]_inst 
       (.I(out_OBUF[0]),
        .O(out[0]));
  OBUF \out_OBUF[1]_inst 
       (.I(out_OBUF[1]),
        .O(out[1]));
  OBUF \out_OBUF[2]_inst 
       (.I(out_OBUF[2]),
        .O(out[2]));
  OBUF \out_OBUF[3]_inst 
       (.I(out_OBUF[3]),
        .O(out[3]));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  LUT6 #(
    .INIT(64'hFFFFFFCF88888888)) 
    \used[0]_i_1 
       (.I0(\used[0]_i_2_n_0 ),
        .I1(en_queue_able),
        .I2(de_queue_able),
        .I3(\used[4]_i_3_n_0 ),
        .I4(\head_reg_n_0_[2] ),
        .I5(used[0]),
        .O(\used[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0006600060000009)) 
    \used[0]_i_2 
       (.I0(count_reg__0[2]),
        .I1(\head_reg_n_0_[2] ),
        .I2(\head_reg_n_0_[0] ),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(\head_reg_n_0_[1] ),
        .O(\used[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFCF88888888)) 
    \used[1]_i_1 
       (.I0(\used[1]_i_2_n_0 ),
        .I1(en_queue_able),
        .I2(de_queue_able),
        .I3(\used[5]_i_3_n_0 ),
        .I4(\head_reg_n_0_[2] ),
        .I5(used[1]),
        .O(\used[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0660000000000990)) 
    \used[1]_i_2 
       (.I0(count_reg__0[2]),
        .I1(\head_reg_n_0_[2] ),
        .I2(\head_reg_n_0_[0] ),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(\head_reg_n_0_[1] ),
        .O(\used[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFCF88888888)) 
    \used[2]_i_1 
       (.I0(\used[2]_i_2_n_0 ),
        .I1(en_queue_able),
        .I2(de_queue_able),
        .I3(\used[6]_i_3_n_0 ),
        .I4(\head_reg_n_0_[2] ),
        .I5(used[2]),
        .O(\used[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6000000900099000)) 
    \used[2]_i_2 
       (.I0(count_reg__0[2]),
        .I1(\head_reg_n_0_[2] ),
        .I2(\head_reg_n_0_[0] ),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(\head_reg_n_0_[1] ),
        .O(\used[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFCFFFFF88888888)) 
    \used[3]_i_1 
       (.I0(\used[3]_i_2_n_0 ),
        .I1(en_queue_able),
        .I2(de_queue_able),
        .I3(\head_reg_n_0_[2] ),
        .I4(\used[7]_i_4_n_0 ),
        .I5(used[3]),
        .O(\used[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000099009900000)) 
    \used[3]_i_2 
       (.I0(count_reg__0[2]),
        .I1(\head_reg_n_0_[2] ),
        .I2(\head_reg_n_0_[0] ),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(\head_reg_n_0_[1] ),
        .O(\used[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFCFFFFF88888888)) 
    \used[4]_i_1 
       (.I0(\used[4]_i_2_n_0 ),
        .I1(en_queue_able),
        .I2(de_queue_able),
        .I3(\used[4]_i_3_n_0 ),
        .I4(\head_reg_n_0_[2] ),
        .I5(used[4]),
        .O(\used[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0009900090000006)) 
    \used[4]_i_2 
       (.I0(count_reg__0[2]),
        .I1(\head_reg_n_0_[2] ),
        .I2(\head_reg_n_0_[0] ),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(\head_reg_n_0_[1] ),
        .O(\used[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \used[4]_i_3 
       (.I0(\head_reg_n_0_[1] ),
        .I1(\head_reg_n_0_[0] ),
        .O(\used[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFCFFFFF88888888)) 
    \used[5]_i_1 
       (.I0(\used[5]_i_2_n_0 ),
        .I1(en_queue_able),
        .I2(de_queue_able),
        .I3(\used[5]_i_3_n_0 ),
        .I4(\head_reg_n_0_[2] ),
        .I5(used[5]),
        .O(\used[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0990000000000660)) 
    \used[5]_i_2 
       (.I0(count_reg__0[2]),
        .I1(\head_reg_n_0_[2] ),
        .I2(\head_reg_n_0_[0] ),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(\head_reg_n_0_[1] ),
        .O(\used[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \used[5]_i_3 
       (.I0(\head_reg_n_0_[1] ),
        .I1(\head_reg_n_0_[0] ),
        .O(\used[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFCFFFFF88888888)) 
    \used[6]_i_1 
       (.I0(\used[6]_i_2_n_0 ),
        .I1(en_queue_able),
        .I2(de_queue_able),
        .I3(\used[6]_i_3_n_0 ),
        .I4(\head_reg_n_0_[2] ),
        .I5(used[6]),
        .O(\used[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9000000600066000)) 
    \used[6]_i_2 
       (.I0(count_reg__0[2]),
        .I1(\head_reg_n_0_[2] ),
        .I2(\head_reg_n_0_[0] ),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(\head_reg_n_0_[1] ),
        .O(\used[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \used[6]_i_3 
       (.I0(\head_reg_n_0_[0] ),
        .I1(\head_reg_n_0_[1] ),
        .O(\used[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hCFFFFFFF88888888)) 
    \used[7]_i_1 
       (.I0(\used[7]_i_2_n_0 ),
        .I1(en_queue_able),
        .I2(de_queue_able),
        .I3(\used[7]_i_4_n_0 ),
        .I4(\head_reg_n_0_[2] ),
        .I5(used[7]),
        .O(\used[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000066006600000)) 
    \used[7]_i_2 
       (.I0(count_reg__0[2]),
        .I1(\head_reg_n_0_[2] ),
        .I2(\head_reg_n_0_[0] ),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(\head_reg_n_0_[1] ),
        .O(\used[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \used[7]_i_3 
       (.I0(p_0_in__0[0]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .I4(count_reg__0[2]),
        .O(de_queue_able));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \used[7]_i_4 
       (.I0(\head_reg_n_0_[1] ),
        .I1(\head_reg_n_0_[0] ),
        .O(\used[7]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \used_reg[0] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\used[0]_i_1_n_0 ),
        .Q(used[0]));
  FDCE #(
    .INIT(1'b0)) 
    \used_reg[1] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\used[1]_i_1_n_0 ),
        .Q(used[1]));
  FDCE #(
    .INIT(1'b0)) 
    \used_reg[2] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\used[2]_i_1_n_0 ),
        .Q(used[2]));
  FDCE #(
    .INIT(1'b0)) 
    \used_reg[3] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\used[3]_i_1_n_0 ),
        .Q(used[3]));
  FDCE #(
    .INIT(1'b0)) 
    \used_reg[4] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\used[4]_i_1_n_0 ),
        .Q(used[4]));
  FDCE #(
    .INIT(1'b0)) 
    \used_reg[5] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\used[5]_i_1_n_0 ),
        .Q(used[5]));
  FDCE #(
    .INIT(1'b0)) 
    \used_reg[6] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\used[6]_i_1_n_0 ),
        .Q(used[6]));
  FDCE #(
    .INIT(1'b0)) 
    \used_reg[7] 
       (.C(Q_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(\used[7]_i_1_n_0 ),
        .Q(used[7]));
endmodule

module Reg_File
   (en_queue_able,
    out_OBUF,
    display_OBUF,
    addr_in,
    Q,
    \count_reg[3] ,
    \addr_out_reg[2] ,
    \addr_dis_reg[2] ,
    D,
    Q_BUFG,
    rst_IBUF);
  output en_queue_able;
  output [3:0]out_OBUF;
  output [6:0]display_OBUF;
  input [2:0]addr_in;
  input [0:0]Q;
  input [3:0]\count_reg[3] ;
  input [2:0]\addr_out_reg[2] ;
  input [2:0]\addr_dis_reg[2] ;
  input [3:0]D;
  input Q_BUFG;
  input rst_IBUF;

  wire [3:0]D;
  wire [0:0]Q;
  wire Q_BUFG;
  wire [2:0]\addr_dis_reg[2] ;
  wire [2:0]addr_in;
  wire [2:0]\addr_out_reg[2] ;
  wire [3:0]\count_reg[3] ;
  wire [6:0]display_OBUF;
  wire \display_OBUF[14]_inst_i_10_n_0 ;
  wire \display_OBUF[14]_inst_i_11_n_0 ;
  wire \display_OBUF[14]_inst_i_12_n_0 ;
  wire \display_OBUF[14]_inst_i_13_n_0 ;
  wire \display_OBUF[14]_inst_i_6_n_0 ;
  wire \display_OBUF[14]_inst_i_7_n_0 ;
  wire \display_OBUF[14]_inst_i_8_n_0 ;
  wire \display_OBUF[14]_inst_i_9_n_0 ;
  wire en_queue_able;
  wire [3:0]out_OBUF;
  wire \out_OBUF[0]_inst_i_2_n_0 ;
  wire \out_OBUF[0]_inst_i_3_n_0 ;
  wire \out_OBUF[1]_inst_i_2_n_0 ;
  wire \out_OBUF[1]_inst_i_3_n_0 ;
  wire \out_OBUF[2]_inst_i_2_n_0 ;
  wire \out_OBUF[2]_inst_i_3_n_0 ;
  wire \out_OBUF[3]_inst_i_2_n_0 ;
  wire \out_OBUF[3]_inst_i_3_n_0 ;
  wire reg_file;
  wire \reg_file[0][3]_i_1_n_0 ;
  wire \reg_file[1][3]_i_1_n_0 ;
  wire \reg_file[2][3]_i_1_n_0 ;
  wire \reg_file[3][3]_i_1_n_0 ;
  wire \reg_file[4][3]_i_1_n_0 ;
  wire \reg_file[5][3]_i_1_n_0 ;
  wire \reg_file[6][3]_i_1_n_0 ;
  wire [3:0]\reg_file_reg[0] ;
  wire [3:0]\reg_file_reg[1] ;
  wire [3:0]\reg_file_reg[2] ;
  wire [3:0]\reg_file_reg[3] ;
  wire [3:0]\reg_file_reg[4] ;
  wire [3:0]\reg_file_reg[5] ;
  wire [3:0]\reg_file_reg[6] ;
  wire [3:0]\reg_file_reg[7] ;
  wire rst_IBUF;
  wire [3:0]sel0;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hAAB0)) 
    \display_OBUF[10]_inst_i_1 
       (.I0(sel0[3]),
        .I1(sel0[0]),
        .I2(sel0[1]),
        .I3(sel0[2]),
        .O(display_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hEA9C)) 
    \display_OBUF[11]_inst_i_1 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .O(display_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFB8)) 
    \display_OBUF[12]_inst_i_1 
       (.I0(sel0[3]),
        .I1(sel0[1]),
        .I2(sel0[2]),
        .I3(sel0[0]),
        .O(display_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hF9B8)) 
    \display_OBUF[13]_inst_i_1 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(display_OBUF[5]));
  LUT4 #(
    .INIT(16'hEAA5)) 
    \display_OBUF[14]_inst_i_1 
       (.I0(sel0[3]),
        .I1(sel0[0]),
        .I2(sel0[2]),
        .I3(sel0[1]),
        .O(display_OBUF[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[14]_inst_i_10 
       (.I0(\reg_file_reg[3] [2]),
        .I1(\reg_file_reg[2] [2]),
        .I2(\addr_dis_reg[2] [1]),
        .I3(\reg_file_reg[1] [2]),
        .I4(\addr_dis_reg[2] [0]),
        .I5(\reg_file_reg[0] [2]),
        .O(\display_OBUF[14]_inst_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[14]_inst_i_11 
       (.I0(\reg_file_reg[7] [2]),
        .I1(\reg_file_reg[6] [2]),
        .I2(\addr_dis_reg[2] [1]),
        .I3(\reg_file_reg[5] [2]),
        .I4(\addr_dis_reg[2] [0]),
        .I5(\reg_file_reg[4] [2]),
        .O(\display_OBUF[14]_inst_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[14]_inst_i_12 
       (.I0(\reg_file_reg[3] [1]),
        .I1(\reg_file_reg[2] [1]),
        .I2(\addr_dis_reg[2] [1]),
        .I3(\reg_file_reg[1] [1]),
        .I4(\addr_dis_reg[2] [0]),
        .I5(\reg_file_reg[0] [1]),
        .O(\display_OBUF[14]_inst_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[14]_inst_i_13 
       (.I0(\reg_file_reg[7] [1]),
        .I1(\reg_file_reg[6] [1]),
        .I2(\addr_dis_reg[2] [1]),
        .I3(\reg_file_reg[5] [1]),
        .I4(\addr_dis_reg[2] [0]),
        .I5(\reg_file_reg[4] [1]),
        .O(\display_OBUF[14]_inst_i_13_n_0 ));
  MUXF7 \display_OBUF[14]_inst_i_2 
       (.I0(\display_OBUF[14]_inst_i_6_n_0 ),
        .I1(\display_OBUF[14]_inst_i_7_n_0 ),
        .O(sel0[3]),
        .S(\addr_dis_reg[2] [2]));
  MUXF7 \display_OBUF[14]_inst_i_3 
       (.I0(\display_OBUF[14]_inst_i_8_n_0 ),
        .I1(\display_OBUF[14]_inst_i_9_n_0 ),
        .O(sel0[0]),
        .S(\addr_dis_reg[2] [2]));
  MUXF7 \display_OBUF[14]_inst_i_4 
       (.I0(\display_OBUF[14]_inst_i_10_n_0 ),
        .I1(\display_OBUF[14]_inst_i_11_n_0 ),
        .O(sel0[2]),
        .S(\addr_dis_reg[2] [2]));
  MUXF7 \display_OBUF[14]_inst_i_5 
       (.I0(\display_OBUF[14]_inst_i_12_n_0 ),
        .I1(\display_OBUF[14]_inst_i_13_n_0 ),
        .O(sel0[1]),
        .S(\addr_dis_reg[2] [2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[14]_inst_i_6 
       (.I0(\reg_file_reg[3] [3]),
        .I1(\reg_file_reg[2] [3]),
        .I2(\addr_dis_reg[2] [1]),
        .I3(\reg_file_reg[1] [3]),
        .I4(\addr_dis_reg[2] [0]),
        .I5(\reg_file_reg[0] [3]),
        .O(\display_OBUF[14]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[14]_inst_i_7 
       (.I0(\reg_file_reg[7] [3]),
        .I1(\reg_file_reg[6] [3]),
        .I2(\addr_dis_reg[2] [1]),
        .I3(\reg_file_reg[5] [3]),
        .I4(\addr_dis_reg[2] [0]),
        .I5(\reg_file_reg[4] [3]),
        .O(\display_OBUF[14]_inst_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[14]_inst_i_8 
       (.I0(\reg_file_reg[3] [0]),
        .I1(\reg_file_reg[2] [0]),
        .I2(\addr_dis_reg[2] [1]),
        .I3(\reg_file_reg[1] [0]),
        .I4(\addr_dis_reg[2] [0]),
        .I5(\reg_file_reg[0] [0]),
        .O(\display_OBUF[14]_inst_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \display_OBUF[14]_inst_i_9 
       (.I0(\reg_file_reg[7] [0]),
        .I1(\reg_file_reg[6] [0]),
        .I2(\addr_dis_reg[2] [1]),
        .I3(\reg_file_reg[5] [0]),
        .I4(\addr_dis_reg[2] [0]),
        .I5(\reg_file_reg[4] [0]),
        .O(\display_OBUF[14]_inst_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hAA9C)) 
    \display_OBUF[8]_inst_i_1 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .O(display_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hACE8)) 
    \display_OBUF[9]_inst_i_1 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(display_OBUF[1]));
  MUXF7 \out_OBUF[0]_inst_i_1 
       (.I0(\out_OBUF[0]_inst_i_2_n_0 ),
        .I1(\out_OBUF[0]_inst_i_3_n_0 ),
        .O(out_OBUF[0]),
        .S(\addr_out_reg[2] [2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out_OBUF[0]_inst_i_2 
       (.I0(\reg_file_reg[3] [0]),
        .I1(\reg_file_reg[2] [0]),
        .I2(\addr_out_reg[2] [1]),
        .I3(\reg_file_reg[1] [0]),
        .I4(\addr_out_reg[2] [0]),
        .I5(\reg_file_reg[0] [0]),
        .O(\out_OBUF[0]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out_OBUF[0]_inst_i_3 
       (.I0(\reg_file_reg[7] [0]),
        .I1(\reg_file_reg[6] [0]),
        .I2(\addr_out_reg[2] [1]),
        .I3(\reg_file_reg[5] [0]),
        .I4(\addr_out_reg[2] [0]),
        .I5(\reg_file_reg[4] [0]),
        .O(\out_OBUF[0]_inst_i_3_n_0 ));
  MUXF7 \out_OBUF[1]_inst_i_1 
       (.I0(\out_OBUF[1]_inst_i_2_n_0 ),
        .I1(\out_OBUF[1]_inst_i_3_n_0 ),
        .O(out_OBUF[1]),
        .S(\addr_out_reg[2] [2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out_OBUF[1]_inst_i_2 
       (.I0(\reg_file_reg[3] [1]),
        .I1(\reg_file_reg[2] [1]),
        .I2(\addr_out_reg[2] [1]),
        .I3(\reg_file_reg[1] [1]),
        .I4(\addr_out_reg[2] [0]),
        .I5(\reg_file_reg[0] [1]),
        .O(\out_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out_OBUF[1]_inst_i_3 
       (.I0(\reg_file_reg[7] [1]),
        .I1(\reg_file_reg[6] [1]),
        .I2(\addr_out_reg[2] [1]),
        .I3(\reg_file_reg[5] [1]),
        .I4(\addr_out_reg[2] [0]),
        .I5(\reg_file_reg[4] [1]),
        .O(\out_OBUF[1]_inst_i_3_n_0 ));
  MUXF7 \out_OBUF[2]_inst_i_1 
       (.I0(\out_OBUF[2]_inst_i_2_n_0 ),
        .I1(\out_OBUF[2]_inst_i_3_n_0 ),
        .O(out_OBUF[2]),
        .S(\addr_out_reg[2] [2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out_OBUF[2]_inst_i_2 
       (.I0(\reg_file_reg[3] [2]),
        .I1(\reg_file_reg[2] [2]),
        .I2(\addr_out_reg[2] [1]),
        .I3(\reg_file_reg[1] [2]),
        .I4(\addr_out_reg[2] [0]),
        .I5(\reg_file_reg[0] [2]),
        .O(\out_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out_OBUF[2]_inst_i_3 
       (.I0(\reg_file_reg[7] [2]),
        .I1(\reg_file_reg[6] [2]),
        .I2(\addr_out_reg[2] [1]),
        .I3(\reg_file_reg[5] [2]),
        .I4(\addr_out_reg[2] [0]),
        .I5(\reg_file_reg[4] [2]),
        .O(\out_OBUF[2]_inst_i_3_n_0 ));
  MUXF7 \out_OBUF[3]_inst_i_1 
       (.I0(\out_OBUF[3]_inst_i_2_n_0 ),
        .I1(\out_OBUF[3]_inst_i_3_n_0 ),
        .O(out_OBUF[3]),
        .S(\addr_out_reg[2] [2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out_OBUF[3]_inst_i_2 
       (.I0(\reg_file_reg[3] [3]),
        .I1(\reg_file_reg[2] [3]),
        .I2(\addr_out_reg[2] [1]),
        .I3(\reg_file_reg[1] [3]),
        .I4(\addr_out_reg[2] [0]),
        .I5(\reg_file_reg[0] [3]),
        .O(\out_OBUF[3]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \out_OBUF[3]_inst_i_3 
       (.I0(\reg_file_reg[7] [3]),
        .I1(\reg_file_reg[6] [3]),
        .I2(\addr_out_reg[2] [1]),
        .I3(\reg_file_reg[5] [3]),
        .I4(\addr_out_reg[2] [0]),
        .I5(\reg_file_reg[4] [3]),
        .O(\out_OBUF[3]_inst_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \reg_file[0][3]_i_1 
       (.I0(en_queue_able),
        .I1(addr_in[2]),
        .I2(addr_in[0]),
        .I3(addr_in[1]),
        .O(\reg_file[0][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \reg_file[1][3]_i_1 
       (.I0(en_queue_able),
        .I1(addr_in[1]),
        .I2(addr_in[2]),
        .I3(addr_in[0]),
        .O(\reg_file[1][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \reg_file[2][3]_i_1 
       (.I0(en_queue_able),
        .I1(addr_in[2]),
        .I2(addr_in[0]),
        .I3(addr_in[1]),
        .O(\reg_file[2][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \reg_file[3][3]_i_1 
       (.I0(en_queue_able),
        .I1(addr_in[1]),
        .I2(addr_in[0]),
        .I3(addr_in[2]),
        .O(\reg_file[3][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \reg_file[4][3]_i_1 
       (.I0(en_queue_able),
        .I1(addr_in[1]),
        .I2(addr_in[0]),
        .I3(addr_in[2]),
        .O(\reg_file[4][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \reg_file[5][3]_i_1 
       (.I0(en_queue_able),
        .I1(addr_in[2]),
        .I2(addr_in[0]),
        .I3(addr_in[1]),
        .O(\reg_file[5][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \reg_file[6][3]_i_1 
       (.I0(en_queue_able),
        .I1(addr_in[1]),
        .I2(addr_in[2]),
        .I3(addr_in[0]),
        .O(\reg_file[6][3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \reg_file[7][3]_i_1 
       (.I0(en_queue_able),
        .I1(addr_in[2]),
        .I2(addr_in[0]),
        .I3(addr_in[1]),
        .O(reg_file));
  LUT5 #(
    .INIT(32'hAAAAAA8A)) 
    \reg_file[7][3]_i_2 
       (.I0(Q),
        .I1(\count_reg[3] [0]),
        .I2(\count_reg[3] [3]),
        .I3(\count_reg[3] [1]),
        .I4(\count_reg[3] [2]),
        .O(en_queue_able));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[0][0] 
       (.C(Q_BUFG),
        .CE(\reg_file[0][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(\reg_file_reg[0] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[0][1] 
       (.C(Q_BUFG),
        .CE(\reg_file[0][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(\reg_file_reg[0] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[0][2] 
       (.C(Q_BUFG),
        .CE(\reg_file[0][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(\reg_file_reg[0] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[0][3] 
       (.C(Q_BUFG),
        .CE(\reg_file[0][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(\reg_file_reg[0] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[1][0] 
       (.C(Q_BUFG),
        .CE(\reg_file[1][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(\reg_file_reg[1] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[1][1] 
       (.C(Q_BUFG),
        .CE(\reg_file[1][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(\reg_file_reg[1] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[1][2] 
       (.C(Q_BUFG),
        .CE(\reg_file[1][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(\reg_file_reg[1] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[1][3] 
       (.C(Q_BUFG),
        .CE(\reg_file[1][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(\reg_file_reg[1] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[2][0] 
       (.C(Q_BUFG),
        .CE(\reg_file[2][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(\reg_file_reg[2] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[2][1] 
       (.C(Q_BUFG),
        .CE(\reg_file[2][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(\reg_file_reg[2] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[2][2] 
       (.C(Q_BUFG),
        .CE(\reg_file[2][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(\reg_file_reg[2] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[2][3] 
       (.C(Q_BUFG),
        .CE(\reg_file[2][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(\reg_file_reg[2] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[3][0] 
       (.C(Q_BUFG),
        .CE(\reg_file[3][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(\reg_file_reg[3] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[3][1] 
       (.C(Q_BUFG),
        .CE(\reg_file[3][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(\reg_file_reg[3] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[3][2] 
       (.C(Q_BUFG),
        .CE(\reg_file[3][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(\reg_file_reg[3] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[3][3] 
       (.C(Q_BUFG),
        .CE(\reg_file[3][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(\reg_file_reg[3] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[4][0] 
       (.C(Q_BUFG),
        .CE(\reg_file[4][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(\reg_file_reg[4] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[4][1] 
       (.C(Q_BUFG),
        .CE(\reg_file[4][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(\reg_file_reg[4] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[4][2] 
       (.C(Q_BUFG),
        .CE(\reg_file[4][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(\reg_file_reg[4] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[4][3] 
       (.C(Q_BUFG),
        .CE(\reg_file[4][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(\reg_file_reg[4] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[5][0] 
       (.C(Q_BUFG),
        .CE(\reg_file[5][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(\reg_file_reg[5] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[5][1] 
       (.C(Q_BUFG),
        .CE(\reg_file[5][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(\reg_file_reg[5] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[5][2] 
       (.C(Q_BUFG),
        .CE(\reg_file[5][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(\reg_file_reg[5] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[5][3] 
       (.C(Q_BUFG),
        .CE(\reg_file[5][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(\reg_file_reg[5] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[6][0] 
       (.C(Q_BUFG),
        .CE(\reg_file[6][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(\reg_file_reg[6] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[6][1] 
       (.C(Q_BUFG),
        .CE(\reg_file[6][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(\reg_file_reg[6] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[6][2] 
       (.C(Q_BUFG),
        .CE(\reg_file[6][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(\reg_file_reg[6] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[6][3] 
       (.C(Q_BUFG),
        .CE(\reg_file[6][3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(\reg_file_reg[6] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[7][0] 
       (.C(Q_BUFG),
        .CE(reg_file),
        .CLR(rst_IBUF),
        .D(D[0]),
        .Q(\reg_file_reg[7] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[7][1] 
       (.C(Q_BUFG),
        .CE(reg_file),
        .CLR(rst_IBUF),
        .D(D[1]),
        .Q(\reg_file_reg[7] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[7][2] 
       (.C(Q_BUFG),
        .CE(reg_file),
        .CLR(rst_IBUF),
        .D(D[2]),
        .Q(\reg_file_reg[7] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \reg_file_reg[7][3] 
       (.C(Q_BUFG),
        .CE(reg_file),
        .CLR(rst_IBUF),
        .D(D[3]),
        .Q(\reg_file_reg[7] [3]));
endmodule

module clk_wiz_0
   (clk_out1,
    reset,
    locked,
    clk_in1);
  output clk_out1;
  input reset;
  output locked;
  input clk_in1;


endmodule

module clock_500hz
   (Q,
    clk_out1);
  output Q;
  input clk_out1;

  wire Q;
  wire Q_i_1_n_0;
  wire clk_out1;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[0]_i_3_n_0 ;
  wire \cnt[0]_i_4_n_0 ;
  wire \cnt[0]_i_5_n_0 ;
  wire \cnt[0]_i_6_n_0 ;
  wire \cnt[0]_i_7_n_0 ;
  wire \cnt[0]_i_8_n_0 ;
  wire \cnt[0]_i_9_n_0 ;
  wire [22:0]cnt_reg;
  wire \cnt_reg[0]_i_2_n_0 ;
  wire \cnt_reg[0]_i_2_n_1 ;
  wire \cnt_reg[0]_i_2_n_2 ;
  wire \cnt_reg[0]_i_2_n_3 ;
  wire \cnt_reg[0]_i_2_n_4 ;
  wire \cnt_reg[0]_i_2_n_5 ;
  wire \cnt_reg[0]_i_2_n_6 ;
  wire \cnt_reg[0]_i_2_n_7 ;
  wire \cnt_reg[12]_i_1_n_0 ;
  wire \cnt_reg[12]_i_1_n_1 ;
  wire \cnt_reg[12]_i_1_n_2 ;
  wire \cnt_reg[12]_i_1_n_3 ;
  wire \cnt_reg[12]_i_1_n_4 ;
  wire \cnt_reg[12]_i_1_n_5 ;
  wire \cnt_reg[12]_i_1_n_6 ;
  wire \cnt_reg[12]_i_1_n_7 ;
  wire \cnt_reg[16]_i_1_n_0 ;
  wire \cnt_reg[16]_i_1_n_1 ;
  wire \cnt_reg[16]_i_1_n_2 ;
  wire \cnt_reg[16]_i_1_n_3 ;
  wire \cnt_reg[16]_i_1_n_4 ;
  wire \cnt_reg[16]_i_1_n_5 ;
  wire \cnt_reg[16]_i_1_n_6 ;
  wire \cnt_reg[16]_i_1_n_7 ;
  wire \cnt_reg[20]_i_1_n_2 ;
  wire \cnt_reg[20]_i_1_n_3 ;
  wire \cnt_reg[20]_i_1_n_5 ;
  wire \cnt_reg[20]_i_1_n_6 ;
  wire \cnt_reg[20]_i_1_n_7 ;
  wire \cnt_reg[4]_i_1_n_0 ;
  wire \cnt_reg[4]_i_1_n_1 ;
  wire \cnt_reg[4]_i_1_n_2 ;
  wire \cnt_reg[4]_i_1_n_3 ;
  wire \cnt_reg[4]_i_1_n_4 ;
  wire \cnt_reg[4]_i_1_n_5 ;
  wire \cnt_reg[4]_i_1_n_6 ;
  wire \cnt_reg[4]_i_1_n_7 ;
  wire \cnt_reg[8]_i_1_n_0 ;
  wire \cnt_reg[8]_i_1_n_1 ;
  wire \cnt_reg[8]_i_1_n_2 ;
  wire \cnt_reg[8]_i_1_n_3 ;
  wire \cnt_reg[8]_i_1_n_4 ;
  wire \cnt_reg[8]_i_1_n_5 ;
  wire \cnt_reg[8]_i_1_n_6 ;
  wire \cnt_reg[8]_i_1_n_7 ;
  wire [3:2]\NLW_cnt_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_cnt_reg[20]_i_1_O_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h6)) 
    Q_i_1
       (.I0(\cnt[0]_i_1_n_0 ),
        .I1(Q),
        .O(Q_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out1),
        .CE(1'b1),
        .D(Q_i_1_n_0),
        .Q(Q),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFBFFFFFFFBFBFBFB)) 
    \cnt[0]_i_1 
       (.I0(\cnt[0]_i_3_n_0 ),
        .I1(\cnt[0]_i_4_n_0 ),
        .I2(\cnt[0]_i_5_n_0 ),
        .I3(\cnt[0]_i_6_n_0 ),
        .I4(\cnt[0]_i_7_n_0 ),
        .I5(\cnt[0]_i_8_n_0 ),
        .O(\cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cnt[0]_i_3 
       (.I0(cnt_reg[15]),
        .I1(cnt_reg[13]),
        .I2(cnt_reg[14]),
        .I3(cnt_reg[18]),
        .I4(cnt_reg[16]),
        .I5(cnt_reg[17]),
        .O(\cnt[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cnt[0]_i_4 
       (.I0(cnt_reg[21]),
        .I1(cnt_reg[22]),
        .I2(cnt_reg[20]),
        .I3(cnt_reg[19]),
        .O(\cnt[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hC8)) 
    \cnt[0]_i_5 
       (.I0(cnt_reg[10]),
        .I1(cnt_reg[12]),
        .I2(cnt_reg[11]),
        .O(\cnt[0]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \cnt[0]_i_6 
       (.I0(cnt_reg[5]),
        .I1(cnt_reg[6]),
        .I2(cnt_reg[4]),
        .I3(cnt_reg[3]),
        .O(\cnt[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \cnt[0]_i_7 
       (.I0(cnt_reg[2]),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[1]),
        .O(\cnt[0]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \cnt[0]_i_8 
       (.I0(cnt_reg[7]),
        .I1(cnt_reg[12]),
        .I2(cnt_reg[8]),
        .I3(cnt_reg[9]),
        .O(\cnt[0]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_9 
       (.I0(cnt_reg[0]),
        .O(\cnt[0]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_7 ),
        .Q(cnt_reg[0]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\cnt_reg[0]_i_2_n_0 ,\cnt_reg[0]_i_2_n_1 ,\cnt_reg[0]_i_2_n_2 ,\cnt_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cnt_reg[0]_i_2_n_4 ,\cnt_reg[0]_i_2_n_5 ,\cnt_reg[0]_i_2_n_6 ,\cnt_reg[0]_i_2_n_7 }),
        .S({cnt_reg[3:1],\cnt[0]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_5 ),
        .Q(cnt_reg[10]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_4 ),
        .Q(cnt_reg[11]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_7 ),
        .Q(cnt_reg[12]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[12]_i_1 
       (.CI(\cnt_reg[8]_i_1_n_0 ),
        .CO({\cnt_reg[12]_i_1_n_0 ,\cnt_reg[12]_i_1_n_1 ,\cnt_reg[12]_i_1_n_2 ,\cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[12]_i_1_n_4 ,\cnt_reg[12]_i_1_n_5 ,\cnt_reg[12]_i_1_n_6 ,\cnt_reg[12]_i_1_n_7 }),
        .S(cnt_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_6 ),
        .Q(cnt_reg[13]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_5 ),
        .Q(cnt_reg[14]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_4 ),
        .Q(cnt_reg[15]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[16] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[16]_i_1_n_7 ),
        .Q(cnt_reg[16]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[16]_i_1 
       (.CI(\cnt_reg[12]_i_1_n_0 ),
        .CO({\cnt_reg[16]_i_1_n_0 ,\cnt_reg[16]_i_1_n_1 ,\cnt_reg[16]_i_1_n_2 ,\cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[16]_i_1_n_4 ,\cnt_reg[16]_i_1_n_5 ,\cnt_reg[16]_i_1_n_6 ,\cnt_reg[16]_i_1_n_7 }),
        .S(cnt_reg[19:16]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[17] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[16]_i_1_n_6 ),
        .Q(cnt_reg[17]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[18] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[16]_i_1_n_5 ),
        .Q(cnt_reg[18]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[19] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[16]_i_1_n_4 ),
        .Q(cnt_reg[19]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_6 ),
        .Q(cnt_reg[1]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[20] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[20]_i_1_n_7 ),
        .Q(cnt_reg[20]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[20]_i_1 
       (.CI(\cnt_reg[16]_i_1_n_0 ),
        .CO({\NLW_cnt_reg[20]_i_1_CO_UNCONNECTED [3:2],\cnt_reg[20]_i_1_n_2 ,\cnt_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_reg[20]_i_1_O_UNCONNECTED [3],\cnt_reg[20]_i_1_n_5 ,\cnt_reg[20]_i_1_n_6 ,\cnt_reg[20]_i_1_n_7 }),
        .S({1'b0,cnt_reg[22:20]}));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[21] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[20]_i_1_n_6 ),
        .Q(cnt_reg[21]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[22] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[20]_i_1_n_5 ),
        .Q(cnt_reg[22]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_5 ),
        .Q(cnt_reg[2]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_4 ),
        .Q(cnt_reg[3]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_7 ),
        .Q(cnt_reg[4]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[4]_i_1 
       (.CI(\cnt_reg[0]_i_2_n_0 ),
        .CO({\cnt_reg[4]_i_1_n_0 ,\cnt_reg[4]_i_1_n_1 ,\cnt_reg[4]_i_1_n_2 ,\cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[4]_i_1_n_4 ,\cnt_reg[4]_i_1_n_5 ,\cnt_reg[4]_i_1_n_6 ,\cnt_reg[4]_i_1_n_7 }),
        .S(cnt_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_6 ),
        .Q(cnt_reg[5]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_5 ),
        .Q(cnt_reg[6]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_4 ),
        .Q(cnt_reg[7]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_7 ),
        .Q(cnt_reg[8]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[8]_i_1 
       (.CI(\cnt_reg[4]_i_1_n_0 ),
        .CO({\cnt_reg[8]_i_1_n_0 ,\cnt_reg[8]_i_1_n_1 ,\cnt_reg[8]_i_1_n_2 ,\cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[8]_i_1_n_4 ,\cnt_reg[8]_i_1_n_5 ,\cnt_reg[8]_i_1_n_6 ,\cnt_reg[8]_i_1_n_7 }),
        .S(cnt_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(clk_out1),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_6 ),
        .Q(cnt_reg[9]),
        .R(\cnt[0]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
