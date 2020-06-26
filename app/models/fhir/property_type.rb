module FHIR
  # fhir/property_type.rb
  class PropertyType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PropertyType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = PropertyType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
