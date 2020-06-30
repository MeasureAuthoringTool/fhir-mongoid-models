module FHIR
  # fhir/constraint_severity.rb
  class ConstraintSeverity < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConstraintSeverity'
    field :value, type: String

    def self.transform_json(json_hash, target=ConstraintSeverity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
