require 'simplecov'
require 'simplecov-lcov'

SimpleCov.start do
  add_filter 'spec/'
end

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
SimpleCov::Formatter::LcovFormatter.config do |c|
  c.output_directory = 'coverage/'
  c.lcov_file_name = 'lcov.info'
end
