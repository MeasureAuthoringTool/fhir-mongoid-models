module FHIR
  class ResearchStudyArm < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchStudyArm'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
  end
end
