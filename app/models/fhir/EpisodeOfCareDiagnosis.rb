module FHIR
  class EpisodeOfCareDiagnosis < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EpisodeOfCareDiagnosis'
    embeds_one :condition, class_name: 'Reference'
    embeds_one :role, class_name: 'CodeableConcept'
    field :rank, type:  # primitive
    embeds_one :_rank, class_name: 'Extension'
  end
end
