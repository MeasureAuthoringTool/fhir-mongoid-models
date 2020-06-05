module FHIR
  class ElementDefinitionSlicingDiscriminator < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionSlicingDiscriminator'
    embeds_one :type, class_name: 'DiscriminatorType'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
  end
end
