module FHIR
  class RemittanceOutcome < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RemittanceOutcome'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
