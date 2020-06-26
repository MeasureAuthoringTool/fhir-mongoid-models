module FHIR
  # fhir/identifier_use.rb
  class IdentifierUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'IdentifierUse'
    field :value, type: String

    def self.transform_json(json_hash)
      result = IdentifierUse.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
