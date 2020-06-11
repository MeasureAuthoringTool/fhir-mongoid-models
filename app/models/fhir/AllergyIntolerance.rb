module FHIR
  class AllergyIntolerance < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'AllergyIntolerance'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :clinicalStatus, class_name: 'CodeableConcept'
    embeds_one :verificationStatus, class_name: 'CodeableConcept'
    embeds_one :type, class_name: 'AllergyIntoleranceType'
    embeds_many :category, class_name: 'AllergyIntoleranceCategory'
    embeds_one :criticality, class_name: 'AllergyIntoleranceCriticality'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :onsetPrimitiveDateTime, type:  # primitive
    embeds_one :_onsetPrimitiveDateTime, class_name: 'Extension'
    embeds_one :onsetAge, class_name: 'Age'
    embeds_one :onsetPeriod, class_name: 'Period'
    embeds_one :onsetRange, class_name: 'Range'
    field :onsetPrimitiveString, type:  # primitive
    embeds_one :_onsetPrimitiveString, class_name: 'Extension'
    field :recordedDate, type:  # primitive
    embeds_one :_recordedDate, class_name: 'Extension'
    embeds_one :recorder, class_name: 'Reference'
    embeds_one :asserter, class_name: 'Reference'
    field :lastOccurrence, type:  # primitive
    embeds_one :_lastOccurrence, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :reaction, class_name: 'AllergyIntoleranceReaction'
  end
end
