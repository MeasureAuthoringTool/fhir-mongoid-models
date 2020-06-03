module FHIR
  class DeviceDefinitionMaterial < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DeviceDefinitionMaterial'
    embeds_one :substance, class_name: 'CodeableConcept'
    field :alternate, type:  # primitive
    embeds_one :_alternate, class_name: 'Extension'
    field :allergenicIndicator, type:  # primitive
    embeds_one :_allergenicIndicator, class_name: 'Extension'
  end
end
