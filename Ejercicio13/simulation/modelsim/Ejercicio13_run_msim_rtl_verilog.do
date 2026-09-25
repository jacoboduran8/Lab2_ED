transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.1/Lab2/Ejercicio13 {C:/altera/13.1/Lab2/Ejercicio13/Ejercicio13.v}

vlog -vlog01compat -work work +incdir+C:/altera/13.1/Lab2/Ejercicio13 {C:/altera/13.1/Lab2/Ejercicio13/tb_Ejercicio13.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_Ejercicio13

add wave *
view structure
view signals
run -all
