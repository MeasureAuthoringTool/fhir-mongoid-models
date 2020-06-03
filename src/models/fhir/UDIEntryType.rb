module FHIR
  class UDIEntryType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'UDIEntryType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
