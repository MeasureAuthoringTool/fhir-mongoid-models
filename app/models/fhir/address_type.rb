module FHIR
  # fhir/address_type.rb
  class AddressType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AddressType'
    field :value, type: String

    def self.transform_json(json_hash, target=AddressType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
