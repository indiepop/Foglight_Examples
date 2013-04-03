require "staf_controller"

process = STAF::Process.new 'STAF', "localhost"

revert_command = '"\"D:/Tools/VMware workstation/vmrun.exe\" -T ws revertToSnapshot \"D:/Test_Environments/rhel564_foglight/Red Hat Enterprise Linux 5 64-bit.vmx\" \"foglight_rhel564\""'
start_command  = '"\"D:/Tools/VMware workstation/vmrun.exe\" -T ws start \"D:/Test_Environments/rhel564_foglight/Red Hat Enterprise Linux 5 64-bit.vmx\""'

process.execute :command => revert_command, :params => "WAIT"
process.execute :command => start_command,  :params => "WAIT"

sleep 60