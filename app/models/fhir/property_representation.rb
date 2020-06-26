module FHIR
  # fhir/property_representation.rb
  class PropertyRepresentation < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PropertyRepresentation'
    field :value, type: String

    def self.transform_json(json_hash)
      result = PropertyRepresentation.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
