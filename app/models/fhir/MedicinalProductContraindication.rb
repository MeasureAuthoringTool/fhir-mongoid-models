module FHIR
  class MedicinalProductContraindication < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductContraindication'
    embeds_many :subject, class_name: 'Reference'
    embeds_one :disease, class_name: 'CodeableConcept'
    embeds_one :diseaseStatus, class_name: 'CodeableConcept'
    embeds_many :comorbidity, class_name: 'CodeableConcept'
    embeds_many :therapeuticIndication, class_name: 'Reference'
    embeds_many :otherTherapy, class_name: 'MedicinalProductContraindicationOtherTherapy'
    embeds_many :population, class_name: 'Population'
  end
end
