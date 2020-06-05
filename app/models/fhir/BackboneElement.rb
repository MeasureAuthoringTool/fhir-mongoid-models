module FHIR
  class BackboneElement < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'BackboneElement'
    embeds_many :modifierExtension, class_name: 'Extension'
  end
end
