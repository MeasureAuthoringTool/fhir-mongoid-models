module CQM
  # bonnie/ValueSet.rb
  class ValueSet
    include Mongoid::Document
    embeds_one :fhir_value_set, class_name: 'FHIR::ValueSet'
  end
end
