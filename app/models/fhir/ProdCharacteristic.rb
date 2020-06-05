module FHIR
  class ProdCharacteristic < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ProdCharacteristic'
    embeds_one :height, class_name: 'Quantity'
    embeds_one :width, class_name: 'Quantity'
    embeds_one :depth, class_name: 'Quantity'
    embeds_one :weight, class_name: 'Quantity'
    embeds_one :nominalVolume, class_name: 'Quantity'
    embeds_one :externalDiameter, class_name: 'Quantity'
    field :shape, type:  # primitive
    embeds_one :_shape, class_name: 'Extension'
    field :color, type: Array # primitive
    embeds_many :_color, class_name: 'Extension'
    field :imprint, type: Array # primitive
    embeds_many :_imprint, class_name: 'Extension'
    embeds_many :image, class_name: 'Attachment'
    embeds_one :scoring, class_name: 'CodeableConcept'
  end
end
