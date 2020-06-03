module FHIR
  class VisionPrescriptionLensSpecification < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionPrescriptionLensSpecification'
    embeds_one :product, class_name: 'CodeableConcept'
    embeds_one :eye, class_name: 'VisionEyes'
    field :sphere, type:  # primitive
    embeds_one :_sphere, class_name: 'Extension'
    field :cylinder, type:  # primitive
    embeds_one :_cylinder, class_name: 'Extension'
    field :axis, type:  # primitive
    embeds_one :_axis, class_name: 'Extension'
    embeds_many :prism, class_name: 'VisionPrescriptionLensSpecificationPrism'
    field :add, type:  # primitive
    embeds_one :_add, class_name: 'Extension'
    field :power, type:  # primitive
    embeds_one :_power, class_name: 'Extension'
    field :backCurve, type:  # primitive
    embeds_one :_backCurve, class_name: 'Extension'
    field :diameter, type:  # primitive
    embeds_one :_diameter, class_name: 'Extension'
    embeds_one :duration, class_name: 'SimpleQuantity'
    field :color, type:  # primitive
    embeds_one :_color, class_name: 'Extension'
    field :brand, type:  # primitive
    embeds_one :_brand, class_name: 'Extension'
    embeds_many :note, class_name: 'Annotation'
  end
end
