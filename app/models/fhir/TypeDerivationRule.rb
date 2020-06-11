module FHIR
  class TypeDerivationRule < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TypeDerivationRule'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
