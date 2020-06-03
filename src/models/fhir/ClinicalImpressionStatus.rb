module FHIR
  class ClinicalImpressionStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ClinicalImpressionStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
