module FHIR
  class SubstanceSpecificationNameOfficial < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationNameOfficial'
    embeds_one :authority, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'
    field :date, type:  # primitive
    embeds_one :_date, class_name: 'Extension'
  end
end
