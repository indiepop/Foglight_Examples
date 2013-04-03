# This file actually needed for proper IDE auto-completion and code highlighting.

# ./base classes/
require 'core_infrastructure/base_classes/Object'
require 'core_infrastructure/base_classes/Element'
require 'core_infrastructure/base_classes/Container'

# ./ui/dwr/
require 'core_infrastructure/components/DwrElement'
require 'core_infrastructure/components/DwrContainer'

require 'core_infrastructure/components/Screen'
require 'core_infrastructure/components/Collapsible'
require 'core_infrastructure/components/Tree'
require 'core_infrastructure/components/TreeElement'
require 'core_infrastructure/components/CollapsibleTreeElement'
require 'core_infrastructure/components/SearchField'
require 'core_infrastructure/components/Input'
require 'core_infrastructure/components/Upload'
require 'core_infrastructure/components/Icon'

# Form
require 'core_infrastructure/components/Button'
require 'core_infrastructure/components/CheckBox'


# Grid
require 'core_infrastructure/components/GridWcfTable'
require 'core_infrastructure/components/GridWcfTableRow'
require 'core_infrastructure/components/TreeWcfTable'
require 'core_infrastructure/components/TreeWcfTableElement'

# Column Topology
require 'core_infrastructure/components/ColumnTopology'
require 'core_infrastructure/components/ColumnTopologyNode'
require 'core_infrastructure/components/ColumnTopologyGroupNode'

# Framed Box Containers
require 'core_infrastructure/components/Dialog'
require 'core_infrastructure/components/Panel'
require 'core_infrastructure/components/Popup'
require 'core_infrastructure/components/PopupMenu'
require 'core_infrastructure/components/Tab'
require 'core_infrastructure/components/ExtDialog'

# Metrics
require 'core_infrastructure/components/Metric.rb'
require 'core_infrastructure/components/Cylinder.rb'
require 'core_infrastructure/components/HorizontalBar.rb'
require 'core_infrastructure/components/VerticalBar.rb'
require 'core_infrastructure/components/Spinner.rb'
require 'core_infrastructure/components/MetricIndicator.rb'
require 'core_infrastructure/components/FlowGauge.rb'

# Mics
require 'core_infrastructure/components/Link'
require 'core_infrastructure/components/Text'
require 'core_infrastructure/components/Calendar'


# ./ui/ext/
require 'core_infrastructure/utils/SeleniumUtils'
require 'core_infrastructure/utils/CucumberUtils'
#
#require 'core_infrastructure/components/legacy/Table.rb'