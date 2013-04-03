require "staf_controller"

process = STAF::Process.new 'STAF', "localhost"

revert_command = '"\"D:/Tools/VMware workstation/vmrun.exe\" -T ws revertToSnapshot \"D:/Test_Environments/win2k364/Clone of win2k364_foglight_ghostrider.vmx\" \"foglight_trunk_smoke\""'
start_command  = '"\"D:/Tools/VMware workstation/vmrun.exe\" -T ws start \"D:/Test_Environments/win2k364/Clone of win2k364_foglight_ghostrider.vmx\""'

process.execute :command => revert_command, :params => "WAIT"
process.execute :command => start_command,  :params => "WAIT"

sleep 60