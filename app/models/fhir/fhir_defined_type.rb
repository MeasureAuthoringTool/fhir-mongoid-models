module FHIR
  # fhir/fhir_defined_type.rb
  class FHIRDefinedType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FHIRDefinedType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = FHIRDefinedType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
