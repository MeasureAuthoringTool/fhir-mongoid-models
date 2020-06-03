module FHIR
  class FHIRSubstanceStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FHIRSubstanceStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
