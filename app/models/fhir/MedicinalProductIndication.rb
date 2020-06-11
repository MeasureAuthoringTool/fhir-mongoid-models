module FHIR
  class MedicinalProductIndication < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIndication'
    embeds_many :subject, class_name: 'Reference'
    embeds_one :diseaseSymptomProcedure, class_name: 'CodeableConcept'
    embeds_one :diseaseStatus, class_name: 'CodeableConcept'
    embeds_many :comorbidity, class_name: 'CodeableConcept'
    embeds_one :intendedEffect, class_name: 'CodeableConcept'
    embeds_one :duration, class_name: 'Quantity'
    embeds_many :otherTherapy, class_name: 'MedicinalProductIndicationOtherTherapy'
    embeds_many :undesirableEffect, class_name: 'Reference'
    embeds_many :population, class_name: 'Population'
  end
end
