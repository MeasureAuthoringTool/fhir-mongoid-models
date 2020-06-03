module FHIR
  class ContractPublicationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractPublicationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
