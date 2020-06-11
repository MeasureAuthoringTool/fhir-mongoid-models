module FHIR
  class ResearchStudyObjective < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchStudyObjective'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
  end
end
