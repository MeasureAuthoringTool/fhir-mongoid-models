module FHIR
  class ClaimDiagnosis < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClaimDiagnosis'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    embeds_one :diagnosisCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :diagnosisReference, class_name: 'Reference'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_one :onAdmission, class_name: 'CodeableConcept'
    embeds_one :packageCode, class_name: 'CodeableConcept'
  end
end
