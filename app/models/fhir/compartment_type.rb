module FHIR
  # fhir/compartment_type.rb
  class CompartmentType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CompartmentType'
    field :value, type: String

    def self.transform_json(json_hash, target=CompartmentType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
