module FHIR
  class ContractStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ContractStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
