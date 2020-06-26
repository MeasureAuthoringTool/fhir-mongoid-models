module FHIR
  # fhir/naming_system_identifier_type.rb
  class NamingSystemIdentifierType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NamingSystemIdentifierType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = NamingSystemIdentifierType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
