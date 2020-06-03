module FHIR
  class EncounterDiagnosis < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterDiagnosis'
    embeds_one :condition, class_name: 'Reference'
    embeds_one :use, class_name: 'CodeableConcept'
    field :rank, type:  # primitive
    embeds_one :_rank, class_name: 'Extension'
  end
end
