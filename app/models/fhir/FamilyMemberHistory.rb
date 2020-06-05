module FHIR
  class FamilyMemberHistory < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'FamilyMemberHistory'
    embeds_many :identifier, class_name: 'Identifier'
    field :instantiatesCanonical, type: Array # primitive
    embeds_many :_instantiatesCanonical, class_name: 'Extension'
    field :instantiatesUri, type: Array # primitive
    embeds_many :_instantiatesUri, class_name: 'Extension'
    embeds_one :status, class_name: 'FamilyHistoryStatus'
    embeds_one :dataAbsentReason, class_name: 'CodeableConcept'
    embeds_one :patient, class_name: 'Reference'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :relationship, class_name: 'CodeableConcept'
    embeds_one :sex, class_name: 'CodeableConcept'
    embeds_one :bornPeriod, class_name: 'Period'
    field :bornPrimitiveDate, type:  # primitive
    embeds_one :_bornPrimitiveDate, class_name: 'Extension'
    field :bornPrimitiveString, type:  # primitive
    embeds_one :_bornPrimitiveString, class_name: 'Extension'
    embeds_one :ageAge, class_name: 'Age'
    embeds_one :ageRange, class_name: 'Range'
    field :agePrimitiveString, type:  # primitive
    embeds_one :_agePrimitiveString, class_name: 'Extension'
    field :estimatedAge, type:  # primitive
    embeds_one :_estimatedAge, class_name: 'Extension'
    field :deceasedPrimitiveBoolean, type:  # primitive
    embeds_one :_deceasedPrimitiveBoolean, class_name: 'Extension'
    embeds_one :deceasedAge, class_name: 'Age'
    embeds_one :deceasedRange, class_name: 'Range'
    field :deceasedPrimitiveDate, type:  # primitive
    embeds_one :_deceasedPrimitiveDate, class_name: 'Extension'
    field :deceasedPrimitiveString, type:  # primitive
    embeds_one :_deceasedPrimitiveString, class_name: 'Extension'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :condition, class_name: 'FamilyMemberHistoryCondition'
  end
end
