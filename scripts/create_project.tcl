# create_project.tcl

# Create a new project called BlinkingLED in folder ./BlinkingLED
create_project BlinkingLED ./BlinkingLED -part xc7a35tcpg236-1 -force

# Add your HDL source files
add_files ./src/Blinking_LED.sv
add_files ./src/tb_Blinking_LED.sv

set_property top tb_Blinking_LED [get_filesets sim_1]
launch_simulation