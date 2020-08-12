require_relative '../../../app/models/models'
require_relative '../../../app/models/cqm/value_set'
require_relative '../../../app/models/cqm/patient'
require_relative '../../../app/models/cqm/measure'
require_relative '../../../app/models/cqm/measure_package'
require_relative '../../../app/models/cqm/logic_library'
require_relative '../../../app/models/cqm/cql_statement_dependency'
require_relative '../../../app/models/cqm/population_set'
require_relative '../../../app/models/cqm/data_element'

# Require all files in directories under lib/ext that contain custom extensions
# on the autogenerated classes
Dir[File.join(__dir__, '../../ext/**', '*.rb')].each{ |file| require_relative file }
