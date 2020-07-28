module FHIR
  # fhir/variable_type.rb
  class VariableType < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = VariableType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
