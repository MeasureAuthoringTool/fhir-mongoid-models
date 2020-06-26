module FHIR
  # fhir/address_use.rb
  class AddressUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AddressUse'
    field :value, type: String

    def self.transform_json(json_hash)
      result = AddressUse.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
