module FHIR
  class EncounterHospitalization < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterHospitalization'
    embeds_one :preAdmissionIdentifier, class_name: 'Identifier'
    embeds_one :origin, class_name: 'Reference'
    embeds_one :admitSource, class_name: 'CodeableConcept'
    embeds_one :reAdmission, class_name: 'CodeableConcept'
    embeds_many :dietPreference, class_name: 'CodeableConcept'
    embeds_many :specialCourtesy, class_name: 'CodeableConcept'
    embeds_many :specialArrangement, class_name: 'CodeableConcept'
    embeds_one :destination, class_name: 'Reference'
    embeds_one :dischargeDisposition, class_name: 'CodeableConcept'
  end
end
