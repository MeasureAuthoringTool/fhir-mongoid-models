module FHIR
  class MedicinalProductUndesirableEffect < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductUndesirableEffect'
    embeds_many :subject, class_name: 'Reference'
    embeds_one :symptomConditionEffect, class_name: 'CodeableConcept'
    embeds_one :classification, class_name: 'CodeableConcept'
    embeds_one :frequencyOfOccurrence, class_name: 'CodeableConcept'
    embeds_many :population, class_name: 'Population'
  end
end
