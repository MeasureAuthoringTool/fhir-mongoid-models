module FHIR
  class MedicinalProductAuthorizationProcedure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductAuthorizationProcedure'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :datePeriod, class_name: 'Period'
    field :datePrimitiveDateTime, type:  # primitive
    embeds_one :_datePrimitiveDateTime, class_name: 'Extension'
    embeds_many :application, class_name: 'MedicinalProductAuthorizationProcedure'
  end
end
