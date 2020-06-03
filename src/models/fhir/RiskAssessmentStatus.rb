module FHIR
  class RiskAssessmentStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskAssessmentStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
