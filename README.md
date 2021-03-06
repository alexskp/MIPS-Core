# MIPS-Core
Simple implementation of single-cycle datapath MIPS core in Verilog.

![MIPS](/images/Single-cycle-MIPS.PNG)

It supports I-type, R-type, load/store, branch and jump commands. You can test the core using ModelSim simulation tool and rom_init.dat file with your program. Also you can initialize RAM with ram_init.dat file.

Example of the rom_init.dat file:

    //              I-TYPE
    //  ______________________________________
    // |  OP  | Rs  | Rt  |        Imm        |

        001000_00000_00001_0000_0000_0000_1111      // #0       addi    $r1, $r0, 15
        001001_00001_00010_1111_1111_1111_1011      // #1       addiu   $r2, $r1, -5
        001100_00010_00011_0000_0000_0000_1100      // #2       andi    $r3, $r2, 12
        001101_00011_00100_0000_0000_0000_0011      // #3       ori     $r4, $r3, 3
        001010_00011_00101_0000_0000_0000_1110      // #4       slti    $r5, $r3, 14


    //              R-TYPE
    //  _____________________________________
    // |  OP  | Rs  | Rt  | Rd  | sa  |funct |

        000000_00001_00010_00101_00000_100000       // #5       add     $r5, $r1, $r2
        000000_00011_00100_00110_00000_100001       // #6       addu    $r6, $r3, $r4
        000000_00101_00110_00111_00000_100010       // #7       sub     $r7, $r5, $r6
        000000_00110_00111_01000_00000_100011       // #8       subu    $r8, $r6, $r7
        000000_00111_01000_01001_00000_100100       // #9       and     $r9, $r7, $r8
        000000_00100_01001_01010_00000_100101       // #10      or      $r10, $r4, $r9
        000000_00100_01001_01100_00000_100111       // #11      nor     $r12, $r4, $r9
        000000_01010_01001_01001_00000_101010       // #12      slt     $r9, $r10, $9


    //            LOAD / STORE                      //      LOAD      --   Rt <- MEMORY[Rs + Imm]
    //  ______________________________________      //      STORE     --   Rt -> MEMORY[Rs + Imm]
    // |  OP  | Rs  | Rt  |        Imm        |     //      (Rs - base address, Imm - offset)

        101011_00000_01010_0000_0000_0000_0001      // #13      sw      $r10, 1($r0)     
        100011_00000_01011_0000_0000_0000_0001      // #14      lw      $r11, 1(&r0)


    //                  BRANCH                              
    //  ______________________________________
    // |  OP  | Rs  | Rt  |        Imm        |

        000100_01000_01010_0000_0000_0000_0101      // #15      beq     $r8, $r10, 15


    //              I-TYPE
    //  ______________________________________
    // |  OP  | Rs  | Rt  |        Imm        |

        001000_01000_01000_0000_0000_0000_0001      // #16      addi    $r8, $r8, 1


    //                  JUMP                              
    //  _______________________________________           
    // |  OP  |             Imm                |       

        000010_00_0000_0000_0000_0000_0000_1111     // #17      j       15


For easier viewing the result of simulation you can use wave.do file. Example of simulation:

![Simulation](/images/Simulation.PNG)
