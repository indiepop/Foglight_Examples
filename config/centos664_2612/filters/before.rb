require 'helpers/vm_helper'

include VmHelper

vm_config = {:url => 'https://zhuvcradw02.prod.quest.corp/sdk',
             :username => 'ychen',
             :password => 'CYZ_5910',
             :vm_folder => '26 FG',
             :vm_name => 'Fog_2612_CentOS62_x64'}

snapshot_name = 'forge_centos64'

vm = connect_vm vm_config
revert_to_snapshot vm, snapshot_name

sleep 60