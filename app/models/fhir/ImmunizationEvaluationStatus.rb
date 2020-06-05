module FHIR
  class ImmunizationEvaluationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ImmunizationEvaluationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
