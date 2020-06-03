module FHIR
  class ExplanationOfBenefitItemDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitItemDetail'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    embeds_one :revenue, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_many :programCode, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    field :factor, type:  # primitive
    embeds_one :_factor, class_name: 'Extension'
    embeds_one :net, class_name: 'Money'
    embeds_many :udi, class_name: 'Reference'
    field :noteNumber, type: Array # primitive
    embeds_many :_noteNumber, class_name: 'Extension'
    embeds_many :adjudication, class_name: 'ExplanationOfBenefitItemAdjudication'
    embeds_many :subDetail, class_name: 'ExplanationOfBenefitItemDetailSubDetail'
  end
end
