module FHIR
  class SubstanceReferenceInformationTarget < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformationTarget'
    embeds_one :target, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :interaction, class_name: 'CodeableConcept'
    embeds_one :organism, class_name: 'CodeableConcept'
    embeds_one :organismType, class_name: 'CodeableConcept'
    embeds_one :amountQuantity, class_name: 'Quantity'
    embeds_one :amountRange, class_name: 'Range'
    field :amountPrimitiveString, type:  # primitive
    embeds_one :_amountPrimitiveString, class_name: 'Extension'
    embeds_one :amountType, class_name: 'CodeableConcept'
    embeds_many :source, class_name: 'Reference'
  end
end
