module FHIR
  class SubstanceSpecificationRelationship < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSpecificationRelationship'
    embeds_one :substanceReference, class_name: 'Reference'
    embeds_one :substanceCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :relationship, class_name: 'CodeableConcept'
    field :isDefining, type:  # primitive
    embeds_one :_isDefining, class_name: 'Extension'
    embeds_one :amountQuantity, class_name: 'Quantity'
    embeds_one :amountRange, class_name: 'Range'
    embeds_one :amountRatio, class_name: 'Ratio'
    field :amountPrimitiveString, type:  # primitive
    embeds_one :_amountPrimitiveString, class_name: 'Extension'
    embeds_one :amountRatioLowLimit, class_name: 'Ratio'
    embeds_one :amountType, class_name: 'CodeableConcept'
    embeds_many :source, class_name: 'Reference'
  end
end
