module FHIR
  class Condition < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Condition'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :clinicalStatus, class_name: 'CodeableConcept'
    embeds_one :verificationStatus, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :severity, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :bodySite, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :onsetPrimitiveDateTime, type:  # primitive
    embeds_one :_onsetPrimitiveDateTime, class_name: 'Extension'
    embeds_one :onsetAge, class_name: 'Age'
    embeds_one :onsetPeriod, class_name: 'Period'
    embeds_one :onsetRange, class_name: 'Range'
    field :onsetPrimitiveString, type:  # primitive
    embeds_one :_onsetPrimitiveString, class_name: 'Extension'
    field :abatementPrimitiveDateTime, type:  # primitive
    embeds_one :_abatementPrimitiveDateTime, class_name: 'Extension'
    embeds_one :abatementAge, class_name: 'Age'
    embeds_one :abatementPeriod, class_name: 'Period'
    embeds_one :abatementRange, class_name: 'Range'
    field :abatementPrimitiveString, type:  # primitive
    embeds_one :_abatementPrimitiveString, class_name: 'Extension'
    field :recordedDate, type:  # primitive
    embeds_one :_recordedDate, class_name: 'Extension'
    embeds_one :recorder, class_name: 'Reference'
    embeds_one :asserter, class_name: 'Reference'
    embeds_many :stage, class_name: 'ConditionStage'
    embeds_many :evidence, class_name: 'ConditionEvidence'
    embeds_many :note, class_name: 'Annotation'
  end
end
