module FHIR
  class VisionPrescriptionLensSpecificationPrism < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionPrescriptionLensSpecificationPrism'
    field :amount, type:  # primitive
    embeds_one :_amount, class_name: 'Extension'
    embeds_one :base, class_name: 'VisionBase'
  end
end
