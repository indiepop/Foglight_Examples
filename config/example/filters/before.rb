require "staf_controller"
#require "camstudio"

process = STAF::Process.new 'STAF', "auto-server"

vmrun_path    = 'C:/Program Files (x86)/VMware/VMware workstation/vmrun.exe'
vmx_path      = 'C:/VMImages/Fog_auto_w2k3R2_32/Fog_auto_w2k3R2_32.vmx'
snapshot_name = 'Snapshot 4'

revert_command = "\"\\\"#{vmrun_path}\\\" -T ws revertToSnapshot \\\"#{vmx_path}\\\" \\\"#{snapshot_name}\\\"\""
start_command  = "\"\\\"#{vmrun_path}\\\" -T ws start \\\"#{vmx_path}\\\"\""

puts revert_command
puts start_command

process.execute :command => revert_command, :params => "WAIT"
process.execute :command => start_command,  :params => "WAIT"

sleep 10

#cam = CamStudio.new
#cam.record