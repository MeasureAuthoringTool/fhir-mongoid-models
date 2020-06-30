module FHIR
  # fhir/udi_entry_type.rb
  class UDIEntryType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'UDIEntryType'
    field :value, type: String

    def self.transform_json(json_hash, target=UDIEntryType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
