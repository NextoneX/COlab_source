# Part 2 Test
# Including JALR, LB, LH, LW, LBU, LHU, SB, SH, SW, BEQ, BNE, BLT, BLTU, BGE, BGEU, JAL


.section .text; .align 6; .globl _start; _start: addi zero,zero, 0

#beq.S
  #-------------------------------------------------------------
  # Branch tests
  #-------------------------------------------------------------

  # Each test checks both forward and backward branches

  test_104: li gp, 104; li x1, 0; li x2, 0; beq x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: beq x1, x2, 1b; bne x0, gp, fail; 3:;
  test_105: li gp, 105; li x1, 1; li x2, 1; beq x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: beq x1, x2, 1b; bne x0, gp, fail; 3:;
  test_106: li gp, 106; li x1, -1; li x2, -1; beq x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: beq x1, x2, 1b; bne x0, gp, fail; 3:;

  test_107: li gp, 107; li x1, 0; li x2, 1; beq x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: beq x1, x2, 1b; 3:;
  test_108: li gp, 108; li x1, 1; li x2, 0; beq x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: beq x1, x2, 1b; 3:;
  test_109: li gp, 109; li x1, -1; li x2, 1; beq x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: beq x1, x2, 1b; 3:;
  test_110: li gp, 110; li x1, 1; li x2, -1; beq x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: beq x1, x2, 1b; 3:;

#bge.S
  #-------------------------------------------------------------
  # Branch tests
  #-------------------------------------------------------------

  # Each test checks both forward and backward branches

  test_124: li gp, 124; li x1, 0; li x2, 0; bge x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bge x1, x2, 1b; bne x0, gp, fail; 3:;
  test_125: li gp, 125; li x1, 1; li x2, 1; bge x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bge x1, x2, 1b; bne x0, gp, fail; 3:;
  test_126: li gp, 126; li x1, -1; li x2, -1; bge x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bge x1, x2, 1b; bne x0, gp, fail; 3:;
  test_127: li gp, 127; li x1, 1; li x2, 0; bge x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bge x1, x2, 1b; bne x0, gp, fail; 3:;
  test_128: li gp, 128; li x1, 1; li x2, -1; bge x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bge x1, x2, 1b; bne x0, gp, fail; 3:;
  test_129: li gp, 129; li x1, -1; li x2, -2; bge x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bge x1, x2, 1b; bne x0, gp, fail; 3:;

  test_130: li gp, 130; li x1, 0; li x2, 1; bge x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bge x1, x2, 1b; 3:;
  test_131: li gp, 131; li x1, -1; li x2, 1; bge x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bge x1, x2, 1b; 3:;
  test_132: li gp, 132; li x1, -2; li x2, -1; bge x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bge x1, x2, 1b; 3:;
  test_133: li gp, 133; li x1, -2; li x2, 1; bge x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bge x1, x2, 1b; 3:;

#bgeu.S
  #-------------------------------------------------------------
  # Branch tests
  #-------------------------------------------------------------

  # Each test checks both forward and backward branches

  test_147: li gp, 147; li x1, 0x00000000; li x2, 0x00000000; bgeu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bgeu x1, x2, 1b; bne x0, gp, fail; 3:;
  test_148: li gp, 148; li x1, 0x00000001; li x2, 0x00000001; bgeu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bgeu x1, x2, 1b; bne x0, gp, fail; 3:;
  test_149: li gp, 149; li x1, 0xffffffff; li x2, 0xffffffff; bgeu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bgeu x1, x2, 1b; bne x0, gp, fail; 3:;
  test_150: li gp, 150; li x1, 0x00000001; li x2, 0x00000000; bgeu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bgeu x1, x2, 1b; bne x0, gp, fail; 3:;
  test_151: li gp, 151; li x1, 0xffffffff; li x2, 0xfffffffe; bgeu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bgeu x1, x2, 1b; bne x0, gp, fail; 3:;
  test_152: li gp, 152; li x1, 0xffffffff; li x2, 0x00000000; bgeu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bgeu x1, x2, 1b; bne x0, gp, fail; 3:;

  test_153: li gp, 153; li x1, 0x00000000; li x2, 0x00000001; bgeu x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bgeu x1, x2, 1b; 3:;
  test_154: li gp, 154; li x1, 0xfffffffe; li x2, 0xffffffff; bgeu x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bgeu x1, x2, 1b; 3:;
  test_155: li gp, 155; li x1, 0x00000000; li x2, 0xffffffff; bgeu x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bgeu x1, x2, 1b; 3:;
  test_156: li gp, 156; li x1, 0x7fffffff; li x2, 0x80000000; bgeu x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bgeu x1, x2, 1b; 3:;

#blt.S
  #-------------------------------------------------------------
  # Branch tests
  #-------------------------------------------------------------

  # Each test checks both forward and backward branches

  test_170: li gp, 170; li x1, 0; li x2, 1; blt x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: blt x1, x2, 1b; bne x0, gp, fail; 3:;
  test_171: li gp, 171; li x1, -1; li x2, 1; blt x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: blt x1, x2, 1b; bne x0, gp, fail; 3:;
  test_172: li gp, 172; li x1, -2; li x2, -1; blt x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: blt x1, x2, 1b; bne x0, gp, fail; 3:;

  test_173: li gp, 173; li x1, 1; li x2, 0; blt x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: blt x1, x2, 1b; 3:;
  test_174: li gp, 174; li x1, 1; li x2, -1; blt x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: blt x1, x2, 1b; 3:;
  test_175: li gp, 175; li x1, -1; li x2, -2; blt x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: blt x1, x2, 1b; 3:;
  test_176: li gp, 176; li x1, 1; li x2, -2; blt x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: blt x1, x2, 1b; 3:;

#bltu.S
  #-------------------------------------------------------------
  # Branch tests
  #-------------------------------------------------------------

  # Each test checks both forward and backward branches

  test_190: li gp, 190; li x1, 0x00000000; li x2, 0x00000001; bltu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bltu x1, x2, 1b; bne x0, gp, fail; 3:;
  test_191: li gp, 191; li x1, 0xfffffffe; li x2, 0xffffffff; bltu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bltu x1, x2, 1b; bne x0, gp, fail; 3:;
  test_192: li gp, 192; li x1, 0x00000000; li x2, 0xffffffff; bltu x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bltu x1, x2, 1b; bne x0, gp, fail; 3:;

  test_193: li gp, 193; li x1, 0x00000001; li x2, 0x00000000; bltu x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bltu x1, x2, 1b; 3:;
  test_194: li gp, 194; li x1, 0xffffffff; li x2, 0xfffffffe; bltu x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bltu x1, x2, 1b; 3:;
  test_195: li gp, 195; li x1, 0xffffffff; li x2, 0x00000000; bltu x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bltu x1, x2, 1b; 3:;
  test_196: li gp, 196; li x1, 0x80000000; li x2, 0x7fffffff; bltu x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bltu x1, x2, 1b; 3:;

 #bne.S
  #-------------------------------------------------------------
  # Branch tests
  #-------------------------------------------------------------

  # Each test checks both forward and backward branches
  # ne
  test_210: li gp, 210; li x1, 0; li x2, 1; bne x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bne x1, x2, 1b; bne x0, gp, fail; 3:;
  test_211: li gp, 211; li x1, 1; li x2, 0; bne x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bne x1, x2, 1b; bne x0, gp, fail; 3:;
  test_212: li gp, 212; li x1, -1; li x2, 1; bne x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bne x1, x2, 1b; bne x0, gp, fail; 3:;
  test_213: li gp, 213; li x1, 1; li x2, -1; bne x1, x2, 2f; bne x0, gp, fail; 1: bne x0, gp, 3f; 2: bne x1, x2, 1b; bne x0, gp, fail; 3:;
  # e
  test_214: li gp, 214; li x1, 0; li x2, 0; bne x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bne x1, x2, 1b; 3:;
  test_215: li gp, 215; li x1, 1; li x2, 1; bne x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bne x1, x2, 1b; 3:;
  test_216: li gp, 216; li x1, -1; li x2, -1; bne x1, x2, 1f; bne x0, gp, 2f; 1: bne x0, gp, fail; 2: bne x1, x2, 1b; 3:;

#jal.S
  #-------------------------------------------------------------
  # Test 2: Basic test
  #-------------------------------------------------------------

jal_test_2:
  li gp, 2
  li ra, 0

  jal x4, jal_target_2
jal_linkaddr_2:
  nop
  nop
  j fail

jal_target_2:
  la x6, jal_linkaddr_2
  bne x6, x4, fail

#jalr.S
  #-------------------------------------------------------------
  # Test 2: Basic test
  #-------------------------------------------------------------

jalr_test_2:
  li gp, 2
  li t0, 0
  la t1, jalr_target_2

  jalr t0, t1, 0
jalr_linkaddr_2:
  j fail

jalr_target_2:
  la t1, jalr_linkaddr_2
  bne t0, t1, fail

#lb.S
  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  test_237: la x1, tdat; lb x30, 0(x1);; li x29, ((0xffffffffffffffff) & ((1 << (32 - 1) << 1) - 1)); li gp, 237; bne x30, x29, fail;;
  test_238: la x1, tdat; lb x30, 1(x1);; li x29, ((0x0000000000000000) & ((1 << (32 - 1) << 1) - 1)); li gp, 238; bne x30, x29, fail;;
  test_239: la x1, tdat; lb x30, 2(x1);; li x29, ((0xfffffffffffffff0) & ((1 << (32 - 1) << 1) - 1)); li gp, 239; bne x30, x29, fail;;
  test_240: la x1, tdat; lb x30, 3(x1);; li x29, ((0x000000000000000f) & ((1 << (32 - 1) << 1) - 1)); li gp, 240; bne x30, x29, fail;;

  # Test with negative offset

  test_241: la x1, tdat4; lb x30, -3(x1);; li x29, ((0xffffffffffffffff) & ((1 << (32 - 1) << 1) - 1)); li gp, 241; bne x30, x29, fail;;
  test_242: la x1, tdat4; lb x30, -2(x1);; li x29, ((0x0000000000000000) & ((1 << (32 - 1) << 1) - 1)); li gp, 242; bne x30, x29, fail;;
  test_243: la x1, tdat4; lb x30, -1(x1);; li x29, ((0xfffffffffffffff0) & ((1 << (32 - 1) << 1) - 1)); li gp, 243; bne x30, x29, fail;;
  test_244: la x1, tdat4; lb x30, 0(x1);; li x29, ((0x000000000000000f) & ((1 << (32 - 1) << 1) - 1)); li gp, 244; bne x30, x29, fail;;

  # Test with a negative base

  test_245: la x1, tdat; addi x1, x1, -32; lb x5, 32(x1);; li x29, ((0xffffffffffffffff) & ((1 << (32 - 1) << 1) - 1)); li gp, 245; bne x5, x29, fail;

  # Test with unaligned base

  test_246: la x1, tdat; addi x1, x1, -6; lb x5, 7(x1);; li x29, ((0x0000000000000000) & ((1 << (32 - 1) << 1) - 1)); li gp, 246; bne x5, x29, fail;

  #-------------------------------------------------------------
  # Test write-after-write hazard
  #-------------------------------------------------------------

  test_253: la x5, tdat; lb x2, 0(x5); li x2, 2;; li x29, ((2) & ((1 << (32 - 1) << 1) - 1)); li gp, 253; bne x2, x29, fail;

  test_254: la x5, tdat; lb x2, 0(x5); nop; li x2, 2;; li x29, ((2) & ((1 << (32 - 1) << 1) - 1)); li gp, 254; bne x2, x29, fail;

 #lbu.S
  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  test_255: la x1, tdat; lbu x30, 0(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 255; bne x30, x29, fail;;
  test_256: la x1, tdat; lbu x30, 1(x1);; li x29, ((0x0000000000000000) & ((1 << (32 - 1) << 1) - 1)); li gp, 256; bne x30, x29, fail;;
  test_257: la x1, tdat; lbu x30, 2(x1);; li x29, ((0x00000000000000f0) & ((1 << (32 - 1) << 1) - 1)); li gp, 257; bne x30, x29, fail;;
  test_258: la x1, tdat; lbu x30, 3(x1);; li x29, ((0x000000000000000f) & ((1 << (32 - 1) << 1) - 1)); li gp, 258; bne x30, x29, fail;;

  # Test with negative offset

  test_259: la x1, tdat4; lbu x30, -3(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 259; bne x30, x29, fail;;
  test_260: la x1, tdat4; lbu x30, -2(x1);; li x29, ((0x0000000000000000) & ((1 << (32 - 1) << 1) - 1)); li gp, 260; bne x30, x29, fail;;
  test_261: la x1, tdat4; lbu x30, -1(x1);; li x29, ((0x00000000000000f0) & ((1 << (32 - 1) << 1) - 1)); li gp, 261; bne x30, x29, fail;;
  test_262: la x1, tdat4; lbu x30, 0(x1);; li x29, ((0x000000000000000f) & ((1 << (32 - 1) << 1) - 1)); li gp, 262; bne x30, x29, fail;;

  # Test with a negative base

  test_263: la x1, tdat; addi x1, x1, -32; lbu x5, 32(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 263; bne x5, x29, fail;

  # Test with unaligned base

  test_264: la x1, tdat; addi x1, x1, -6; lbu x5, 7(x1);; li x29, ((0x0000000000000000) & ((1 << (32 - 1) << 1) - 1)); li gp, 264; bne x5, x29, fail;

  #-------------------------------------------------------------
  # Test write-after-write hazard
  #-------------------------------------------------------------

  test_271: la x5, tdat; lbu x2, 0(x5); li x2, 2;; li x29, ((2) & ((1 << (32 - 1) << 1) - 1)); li gp, 271; bne x2, x29, fail;

  test_272: la x5, tdat; lbu x2, 0(x5); nop; li x2, 2;; li x29, ((2) & ((1 << (32 - 1) << 1) - 1)); li gp, 272; bne x2, x29, fail;

 #lh.S
  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  test_273: la x1, lh_tdat; lh x30, 0(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 273; bne x30, x29, fail;;
  test_274: la x1, lh_tdat; lh x30, 2(x1);; li x29, ((0xffffffffffffff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 274; bne x30, x29, fail;;
  test_275: la x1, lh_tdat; lh x30, 4(x1);; li x29, ((0x0000000000000ff0) & ((1 << (32 - 1) << 1) - 1)); li gp, 275; bne x30, x29, fail;;
  test_276: la x1, lh_tdat; lh x30, 6(x1);; li x29, ((0xfffffffffffff00f) & ((1 << (32 - 1) << 1) - 1)); li gp, 276; bne x30, x29, fail;;

  # Test with negative offset

  test_277: la x1, lh_tdat4; lh x30, -6(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 277; bne x30, x29, fail;;
  test_278: la x1, lh_tdat4; lh x30, -4(x1);; li x29, ((0xffffffffffffff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 278; bne x30, x29, fail;;
  test_279: la x1, lh_tdat4; lh x30, -2(x1);; li x29, ((0x0000000000000ff0) & ((1 << (32 - 1) << 1) - 1)); li gp, 279; bne x30, x29, fail;;
  test_280: la x1, lh_tdat4; lh x30, 0(x1);; li x29, ((0xfffffffffffff00f) & ((1 << (32 - 1) << 1) - 1)); li gp, 280; bne x30, x29, fail;;

  # Test with a negative base

  test_281: la x1, lh_tdat; addi x1, x1, -32; lh x5, 32(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 281; bne x5, x29, fail;

  # Test with unaligned base

  test_282: la x1, lh_tdat; addi x1, x1, -5; lh x5, 7(x1);; li x29, ((0xffffffffffffff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 282; bne x5, x29, fail;

  #-------------------------------------------------------------
  # Test write-after-write hazard
  #-------------------------------------------------------------

  test_289: la x5, lh_tdat; lh x2, 0(x5); li x2, 2;; li x29, ((2) & ((1 << (32 - 1) << 1) - 1)); li gp, 289; bne x2, x29, fail;

  test_290: la x5, lh_tdat; lh x2, 0(x5); nop; li x2, 2;; li x29, ((2) & ((1 << (32 - 1) << 1) - 1)); li gp, 290; bne x2, x29, fail;

 #lhu.S
  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  test_291: la x1, lh_tdat; lhu x30, 0(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 291; bne x30, x29, fail;;
  test_292: la x1, lh_tdat; lhu x30, 2(x1);; li x29, ((0x000000000000ff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 292; bne x30, x29, fail;;
  test_293: la x1, lh_tdat; lhu x30, 4(x1);; li x29, ((0x0000000000000ff0) & ((1 << (32 - 1) << 1) - 1)); li gp, 293; bne x30, x29, fail;;
  test_294: la x1, lh_tdat; lhu x30, 6(x1);; li x29, ((0x000000000000f00f) & ((1 << (32 - 1) << 1) - 1)); li gp, 294; bne x30, x29, fail;;

  # Test with negative offset

  test_295: la x1, lh_tdat4; lhu x30, -6(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 295; bne x30, x29, fail;;
  test_296: la x1, lh_tdat4; lhu x30, -4(x1);; li x29, ((0x000000000000ff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 296; bne x30, x29, fail;;
  test_297: la x1, lh_tdat4; lhu x30, -2(x1);; li x29, ((0x0000000000000ff0) & ((1 << (32 - 1) << 1) - 1)); li gp, 297; bne x30, x29, fail;;
  test_298: la x1, lh_tdat4; lhu x30, 0(x1);; li x29, ((0x000000000000f00f) & ((1 << (32 - 1) << 1) - 1)); li gp, 298; bne x30, x29, fail;;

  # Test with a negative base

  test_299: la x1, lh_tdat; addi x1, x1, -32; lhu x5, 32(x1);; li x29, ((0x00000000000000ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 299; bne x5, x29, fail;

  # Test with unaligned base

  test_300: la x1, lh_tdat; addi x1, x1, -5; lhu x5, 7(x1);; li x29, ((0x000000000000ff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 300; bne x5, x29, fail;

  #-------------------------------------------------------------
  # Test write-after-write hazard
  #-------------------------------------------------------------

  test_307: la x5, lh_tdat; lhu x2, 0(x5); li x2, 2;; li x29, ((2) & ((1 << (32 - 1) << 1) - 1)); li gp, 307; bne x2, x29, fail;

  test_308: la x5, lh_tdat; lhu x2, 0(x5); nop; li x2, 2;; li x29, ((2) & ((1 << (32 - 1) << 1) - 1)); li gp, 308; bne x2, x29, fail;

#lw.S
  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  test_314: la x1, lw_tdat; lw x30, 0(x1);; li x29, ((0x0000000000ff00ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 314; bne x30, x29, fail;;
  test_315: la x1, lw_tdat; lw x30, 4(x1);; li x29, ((0xffffffffff00ff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 315; bne x30, x29, fail;;
  test_316: la x1, lw_tdat; lw x30, 8(x1);; li x29, ((0x000000000ff00ff0) & ((1 << (32 - 1) << 1) - 1)); li gp, 316; bne x30, x29, fail;;
  test_317: la x1, lw_tdat; lw x30, 12(x1);; li x29, ((0xfffffffff00ff00f) & ((1 << (32 - 1) << 1) - 1)); li gp, 317; bne x30, x29, fail;;

  # Test with negative offset

  test_318: la x1, lw_tdat4; lw x30, -12(x1);; li x29, ((0x0000000000ff00ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 318; bne x30, x29, fail;;
  test_319: la x1, lw_tdat4; lw x30, -8(x1);; li x29, ((0xffffffffff00ff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 319; bne x30, x29, fail;;
  test_320: la x1, lw_tdat4; lw x30, -4(x1);; li x29, ((0x000000000ff00ff0) & ((1 << (32 - 1) << 1) - 1)); li gp, 320; bne x30, x29, fail;;
  test_321: la x1, lw_tdat4; lw x30, 0(x1);; li x29, ((0xfffffffff00ff00f) & ((1 << (32 - 1) << 1) - 1)); li gp, 321; bne x30, x29, fail;;

  # Test with a negative base

  test_322: la x1, lw_tdat; addi x1, x1, -32; lw x5, 32(x1);; li x29, ((0x0000000000ff00ff) & ((1 << (32 - 1) << 1) - 1)); li gp, 322; bne x5, x29, fail;

  # Test with unaligned base

  test_323: la x1, lw_tdat; addi x1, x1, -3; lw x5, 7(x1);; li x29, ((0xffffffffff00ff00) & ((1 << (32 - 1) << 1) - 1)); li gp, 323; bne x5, x29, fail;

#sb.S
  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  test_371: 
    la x1, sb_tdat; 
    li x2, 0xffffffffffffffaa; 
    sb x2, 0(x1); 
    lb x30, 0(x1);; 
    li x29, ((0xffffffffffffffaa) & ((1 << (32 - 1) << 1) - 1)); 
    li gp, 371; bne x30, x29, fail;;
  test_372: 
    la x1, sb_tdat; 
    li x2, 0x0000000000000000; 
    sb x2, 1(x1); 
    lb x30, 1(x1);; 
    li x29, ((0x0000000000000000) & ((1 << (32 - 1) << 1) - 1)); 
    li gp, 372; bne x30, x29, fail;;
  test_373: 
    la x1, sb_tdat; 
    li x2, 0xffffffffffffefa0; 
    sb x2, 2(x1); 
    lh x30, 2(x1);; 
    li x29, ((0xffffffffffffefa0) & ((1 << (32 - 1) << 1) - 1)); 
    li gp, 373; bne x30, x29, fail;;
  test_374: la x1, sb_tdat; li x2, 0x000000000000000a; sb x2, 3(x1); lb x30, 3(x1);; li x29, ((0x000000000000000a) & ((1 << (32 - 1) << 1) - 1)); li gp, 374; bne x30, x29, fail;;

  # Test with negative offset

  test_375: la x1, sb_tdat8; li x2, 0xffffffffffffffaa; sb x2, -3(x1); lb x30, -3(x1);; li x29, ((0xffffffffffffffaa) & ((1 << (32 - 1) << 1) - 1)); li gp, 375; bne x30, x29, fail;;
  test_376: la x1, sb_tdat8; li x2, 0x0000000000000000; sb x2, -2(x1); lb x30, -2(x1);; li x29, ((0x0000000000000000) & ((1 << (32 - 1) << 1) - 1)); li gp, 376; bne x30, x29, fail;;
  test_377: la x1, sb_tdat8; li x2, 0xffffffffffffffa0; sb x2, -1(x1); lb x30, -1(x1);; li x29, ((0xffffffffffffffa0) & ((1 << (32 - 1) << 1) - 1)); li gp, 377; bne x30, x29, fail;;
  test_378: la x1, sb_tdat8; li x2, 0x000000000000000a; sb x2, 0(x1); lb x30, 0(x1);; li x29, ((0x000000000000000a) & ((1 << (32 - 1) << 1) - 1)); li gp, 378; bne x30, x29, fail;;

  # Test with a negative base

  test_379: la x1, sb_tdat9; li x2, 0x12345678; addi x4, x1, -32; sb x2, 32(x4); lb x5, 0(x1);; li x29, ((0x78) & ((1 << (32 - 1) << 1) - 1)); li gp, 379; bne x5, x29, fail;

  # Test with unaligned base

  test_380: la x1, sb_tdat9; li x2, 0x00003098; addi x1, x1, -6; sb x2, 7(x1); la x4, sb_tdat10; lb x5, 0(x4);; li x29, ((0xffffffffffffff98) & ((1 << (32 - 1) << 1) - 1)); li gp, 380; bne x5, x29, fail;

#sh.S
  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  test_393: la x1, sh_tdat; li x2, 0x00000000000000aa; sh x2, 0(x1); lh x30, 0(x1);; li x29, ((0x00000000000000aa) & ((1 << (32 - 1) << 1) - 1)); li gp, 393; bne x30, x29, fail;;
  test_394: la x1, sh_tdat; li x2, 0xffffffffffffaa00; sh x2, 2(x1); lh x30, 2(x1);; li x29, ((0xffffffffffffaa00) & ((1 << (32 - 1) << 1) - 1)); li gp, 394; bne x30, x29, fail;;
  test_395: la x1, sh_tdat; li x2, 0xffffffffbeef0aa0; sh x2, 4(x1); lw x30, 4(x1);; li x29, ((0xffffffffbeef0aa0) & ((1 << (32 - 1) << 1) - 1)); li gp, 395; bne x30, x29, fail;;
  test_396: la x1, sh_tdat; li x2, 0xffffffffffffa00a; sh x2, 6(x1); lh x30, 6(x1);; li x29, ((0xffffffffffffa00a) & ((1 << (32 - 1) << 1) - 1)); li gp, 396; bne x30, x29, fail;;

  # Test with negative offset

  test_397: la x1, sh_tdat8; li x2, 0x00000000000000aa; sh x2, -6(x1); lh x30, -6(x1);; li x29, ((0x00000000000000aa) & ((1 << (32 - 1) << 1) - 1)); li gp, 397; bne x30, x29, fail;;
  test_398: la x1, sh_tdat8; li x2, 0xffffffffffffaa00; sh x2, -4(x1); lh x30, -4(x1);; li x29, ((0xffffffffffffaa00) & ((1 << (32 - 1) << 1) - 1)); li gp, 398; bne x30, x29, fail;;
  test_399: la x1, sh_tdat8; li x2, 0x0000000000000aa0; sh x2, -2(x1); lh x30, -2(x1);; li x29, ((0x0000000000000aa0) & ((1 << (32 - 1) << 1) - 1)); li gp, 399; bne x30, x29, fail;;
  test_400: la x1, sh_tdat8; li x2, 0xffffffffffffa00a; sh x2, 0(x1); lh x30, 0(x1);; li x29, ((0xffffffffffffa00a) & ((1 << (32 - 1) << 1) - 1)); li gp, 400; bne x30, x29, fail;;

  # Test with a negative base

  test_401: la x1, sh_tdat9; li x2, 0x12345678; addi x4, x1, -32; sh x2, 32(x4); lh x5, 0(x1);; li x29, ((0x5678) & ((1 << (32 - 1) << 1) - 1)); li gp, 401; bne x5, x29, fail;

  # Test with unaligned base

  test_402: la x1, sh_tdat9; li x2, 0x00003098; addi x1, x1, -5; sh x2, 7(x1); la x4, sh_tdat10; lh x5, 0(x4);; li x29, ((0x3098) & ((1 << (32 - 1) << 1) - 1)); li gp, 402; bne x5, x29, fail;

#sw.S
  #-------------------------------------------------------------
  # Basic tests
  #-------------------------------------------------------------

  test_778: la x1, sw_tdat; li x2, 0x0000000000aa00aa; sw x2, 0(x1); lw x30, 0(x1);; li x29, ((0x0000000000aa00aa) & ((1 << (32 - 1) << 1) - 1)); li gp, 778; bne x30, x29, fail;;
  test_779: la x1, sw_tdat; li x2, 0xffffffffaa00aa00; sw x2, 4(x1); lw x30, 4(x1);; li x29, ((0xffffffffaa00aa00) & ((1 << (32 - 1) << 1) - 1)); li gp, 779; bne x30, x29, fail;;
  test_780: la x1, sw_tdat; li x2, 0x000000000aa00aa0; sw x2, 8(x1); lw x30, 8(x1);; li x29, ((0x000000000aa00aa0) & ((1 << (32 - 1) << 1) - 1)); li gp, 780; bne x30, x29, fail;;
  test_781: la x1, sw_tdat; li x2, 0xffffffffa00aa00a; sw x2, 12(x1); lw x30, 12(x1);; li x29, ((0xffffffffa00aa00a) & ((1 << (32 - 1) << 1) - 1)); li gp, 781; bne x30, x29, fail;;

  # Test with negative offset

  test_782: la x1, sw_tdat8; li x2, 0x0000000000aa00aa; sw x2, -12(x1); lw x30, -12(x1);; li x29, ((0x0000000000aa00aa) & ((1 << (32 - 1) << 1) - 1)); li gp, 782; bne x30, x29, fail;;
  test_783: la x1, sw_tdat8; li x2, 0xffffffffaa00aa00; sw x2, -8(x1); lw x30, -8(x1);; li x29, ((0xffffffffaa00aa00) & ((1 << (32 - 1) << 1) - 1)); li gp, 783; bne x30, x29, fail;;
  test_784: la x1, sw_tdat8; li x2, 0x000000000aa00aa0; sw x2, -4(x1); lw x30, -4(x1);; li x29, ((0x000000000aa00aa0) & ((1 << (32 - 1) << 1) - 1)); li gp, 784; bne x30, x29, fail;;
  test_785: la x1, sw_tdat8; li x2, 0xffffffffa00aa00a; sw x2, 0(x1); lw x30, 0(x1);; li x29, ((0xffffffffa00aa00a) & ((1 << (32 - 1) << 1) - 1)); li gp, 785; bne x30, x29, fail;;

  # Test with a negative base

  test_786: la x1, sw_tdat9; li x2, 0x12345678; addi x4, x1, -32; sw x2, 32(x4); lw x5, 0(x1);; li x29, ((0x12345678) & ((1 << (32 - 1) << 1) - 1)); li gp, 786; bne x5, x29, fail;

  # Test with unaligned base

  test_787: la x1, sw_tdat9; li x2, 0x58213098; addi x1, x1, -3; sw x2, 7(x1); la x4, sw_tdat10; lw x5, 0(x4);; li x29, ((0x58213098) & ((1 << (32 - 1) << 1) - 1)); li gp, 787; bne x5, x29, fail;

  bne x0, gp, pass; fail: finish2: jal x20,finish2; pass: li gp,1;finish1: jal x20,finish1

unimp

  .data
 .pushsection .tohost,"aw",@progbits; .align 6; .global tohost; tohost: .dword 0; .align 6; .global fromhost; fromhost: .dword 0; .popsection; .align 4; .global begin_signature; begin_signature:


.align 1
#lb.S lbu.S
  tdat:
  tdat1: .byte 0xff
  tdat2: .byte 0x00
  tdat3: .byte 0xf0
  tdat4: .byte 0x0f
#sb.S
  sb_tdat:
  sb_tdat1: .byte 0xef
  sb_tdat2: .byte 0xef
  sb_tdat3: .byte 0xef
  sb_tdat4: .byte 0xef
  sb_tdat5: .byte 0xef
  sb_tdat6: .byte 0xef
  sb_tdat7: .byte 0xef
  sb_tdat8: .byte 0xef
  sb_tdat9: .byte 0xef
  sb_tdat10: .byte 0xef
.align 2
#lh.S lhu.S
  lh_tdat:
  lh_tdat1: .half 0x00ff
  lh_tdat2: .half 0xff00
  lh_tdat3: .half 0x0ff0
  lh_tdat4: .half 0xf00f
#sh.S
  sh_tdat:
  sh_tdat1: .half 0xbeef
  sh_tdat2: .half 0xbeef
  sh_tdat3: .half 0xbeef
  sh_tdat4: .half 0xbeef
  sh_tdat5: .half 0xbeef
  sh_tdat6: .half 0xbeef
  sh_tdat7: .half 0xbeef
  sh_tdat8: .half 0xbeef
  sh_tdat9: .half 0xbeef
  sh_tdat10: .half 0xbeef
.align 4
#lw.S
  lw_tdat:
  lw_tdat1: .word 0x00ff00ff
  lw_tdat2: .word 0xff00ff00
  lw_tdat3: .word 0x0ff00ff0
  lw_tdat4: .word 0xf00ff00f
#sw.S
  sw_tdat:
  sw_tdat1: .word 0xdeadbeef
  sw_tdat2: .word 0xdeadbeef
  sw_tdat3: .word 0xdeadbeef
  sw_tdat4: .word 0xdeadbeef
  sw_tdat5: .word 0xdeadbeef
  sw_tdat6: .word 0xdeadbeef
  sw_tdat7: .word 0xdeadbeef
  sw_tdat8: .word 0xdeadbeef
  sw_tdat9: .word 0xdeadbeef
  sw_tdat10: .word 0xdeadbeef
.align 4
#fence_i.S
insn:
  addi a3, a3, 333

.align 4; .global end_signature; end_signature: