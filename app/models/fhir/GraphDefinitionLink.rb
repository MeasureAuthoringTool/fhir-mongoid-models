module FHIR
  class GraphDefinitionLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'GraphDefinitionLink'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    field :sliceName, type:  # primitive
    embeds_one :_sliceName, class_name: 'Extension'
    field :min, type:  # primitive
    embeds_one :_min, class_name: 'Extension'
    field :max, type:  # primitive
    embeds_one :_max, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :target, class_name: 'GraphDefinitionLinkTarget'
  end
end
