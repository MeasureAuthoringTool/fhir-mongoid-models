module FHIR
  class ExplanationOfBenefitInsurance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitInsurance'
    field :focal, type:  # primitive
    embeds_one :_focal, class_name: 'Extension'
    embeds_one :coverage, class_name: 'Reference'
    field :preAuthRef, type: Array # primitive
    embeds_many :_preAuthRef, class_name: 'Extension'
  end
end
