# create_project.tcl

# Create a new project called BlinkingLED in folder ./BlinkingLED
create_project BlinkingLED ./BlinkingLED -part xc7a35tcpg236-1 -force

# Add your HDL source files
add_files ./src/Blinking_LED.sv
add_files ./src/tb_Blinking_LED.sv

# Add your constraints
#add_files ./constraints/blinking_led.xdc

# Import IP cores (if you have any)
#import_ip ./ip/my_core.xci

# Recreate block design if you exported one
#source ./bd/my_design_bd.tcl
set_property top tb_Blinking_LED [get_filesets sim_1]
# Run synthesis and implementation
launch_simulation
#launch_runs synth_1 when i get the FPGA
#launch_runs impl_1