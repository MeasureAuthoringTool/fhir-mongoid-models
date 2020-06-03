module FHIR
  class Dosage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'Dosage'
    field :sequence, type:  # primitive
    embeds_one :_sequence, class_name: 'Extension'
    field :text, type:  # primitive
    embeds_one :_text, class_name: 'Extension'
    embeds_many :additionalInstruction, class_name: 'CodeableConcept'
    field :patientInstruction, type:  # primitive
    embeds_one :_patientInstruction, class_name: 'Extension'
    embeds_one :timing, class_name: 'Timing'
    field :asNeededPrimitiveBoolean, type:  # primitive
    embeds_one :_asNeededPrimitiveBoolean, class_name: 'Extension'
    embeds_one :asNeededCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :site, class_name: 'CodeableConcept'
    embeds_one :route, class_name: 'CodeableConcept'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_many :doseAndRate, class_name: 'DosageDoseAndRate'
    embeds_one :maxDosePerPeriod, class_name: 'Ratio'
    embeds_one :maxDosePerAdministration, class_name: 'SimpleQuantity'
    embeds_one :maxDosePerLifetime, class_name: 'SimpleQuantity'
  end
end
