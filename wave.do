onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mips_core_test/mips_core/i_clk
add wave -noupdate -radix unsigned /mips_core_test/mips_core/pc
add wave -noupdate -radix binary /mips_core_test/mips_core/instr
add wave -noupdate /mips_core_test/mips_core/op
add wave -noupdate /mips_core_test/mips_core/funct
add wave -noupdate -radix decimal /mips_core_test/mips_core/imm
add wave -noupdate /mips_core_test/mips_core/Rs
add wave -noupdate /mips_core_test/mips_core/Rt
add wave -noupdate /mips_core_test/mips_core/Rd
add wave -noupdate -radix decimal /mips_core_test/mips_core/alu_res
add wave -noupdate -radix decimal /mips_core_test/mips_core/ram_out
add wave -noupdate /mips_core_test/mips_core/control/o_regDst
add wave -noupdate /mips_core_test/mips_core/control/o_jump
add wave -noupdate /mips_core_test/mips_core/control/o_branch
add wave -noupdate /mips_core_test/mips_core/control/o_memToReg
add wave -noupdate /mips_core_test/mips_core/control/o_memWrite
add wave -noupdate /mips_core_test/mips_core/control/o_aluSrc
add wave -noupdate /mips_core_test/mips_core/control/o_regWrite
add wave -noupdate /mips_core_test/mips_core/control/o_extOp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {609 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 283
configure wave -valuecolwidth 53
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1072 ns} {1560 ns}
