module FHIR
  class ExplanationOfBenefitStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
