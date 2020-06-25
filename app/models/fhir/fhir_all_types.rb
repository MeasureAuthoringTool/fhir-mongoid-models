module FHIR
  # fhir/fhir_all_types.rb
  class FHIRAllTypes < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FHIRAllTypes'
    field :value, type: String

    def self.transform_json(json_hash)
      result = FHIRAllTypes.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
