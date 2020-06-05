module FHIR
  class AddressUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AddressUse'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
