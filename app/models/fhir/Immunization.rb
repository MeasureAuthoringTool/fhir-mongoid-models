module FHIR
  class Immunization < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Immunization'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ImmunizationStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :vaccineCode, class_name: 'CodeableConcept'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    field :occurrencePrimitiveDateTime, type:  # primitive
    embeds_one :_occurrencePrimitiveDateTime, class_name: 'Extension'
    field :occurrencePrimitiveString, type:  # primitive
    embeds_one :_occurrencePrimitiveString, class_name: 'Extension'
    field :recorded, type:  # primitive
    embeds_one :_recorded, class_name: 'Extension'
    field :primarySource, type:  # primitive
    embeds_one :_primarySource, class_name: 'Extension'
    embeds_one :reportOrigin, class_name: 'CodeableConcept'
    embeds_one :location, class_name: 'Reference'
    embeds_one :manufacturer, class_name: 'Reference'
    field :lotNumber, type:  # primitive
    embeds_one :_lotNumber, class_name: 'Extension'
    field :expirationDate, type:  # primitive
    embeds_one :_expirationDate, class_name: 'Extension'
    embeds_one :site, class_name: 'CodeableConcept'
    embeds_one :route, class_name: 'CodeableConcept'
    embeds_one :doseQuantity, class_name: 'SimpleQuantity'
    embeds_many :performer, class_name: 'ImmunizationPerformer'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    field :isSubpotent, type:  # primitive
    embeds_one :_isSubpotent, class_name: 'Extension'
    embeds_many :subpotentReason, class_name: 'CodeableConcept'
    embeds_many :education, class_name: 'ImmunizationEducation'
    embeds_many :programEligibility, class_name: 'CodeableConcept'
    embeds_one :fundingSource, class_name: 'CodeableConcept'
    embeds_many :reaction, class_name: 'ImmunizationReaction'
    embeds_many :protocolApplied, class_name: 'ImmunizationProtocolApplied'
  end
end
