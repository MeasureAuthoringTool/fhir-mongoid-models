module FHIR
  class SubstanceSpecificationStructureRepresentation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationStructureRepresentation'
    embeds_one :type, class_name: 'CodeableConcept'
    field :representation, type:  # primitive
    embeds_one :_representation, class_name: 'Extension'
    embeds_one :attachment, class_name: 'Attachment'
  end
end
