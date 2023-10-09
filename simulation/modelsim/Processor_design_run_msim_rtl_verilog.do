transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/RegisterFile.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/DataMemory.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/SignExtender.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/ALU.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/LeftShiftBy2.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/ALUDecoder.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/Adder.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/ResetableFF.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/mux2.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/MIPS.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/Controller.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/MainDecoder.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/Datapath.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/TopMIPS.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/MIPStestbench.sv}
vlog -sv -work work +incdir+C:/Verilog_and_SystemVerilog {C:/Verilog_and_SystemVerilog/InsructionMemory2.sv}

