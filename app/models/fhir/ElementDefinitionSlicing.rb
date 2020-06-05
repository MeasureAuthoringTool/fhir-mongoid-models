module FHIR
  class ElementDefinitionSlicing < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionSlicing'
    embeds_many :discriminator, class_name: 'ElementDefinitionSlicingDiscriminator'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :ordered, type:  # primitive
    embeds_one :_ordered, class_name: 'Extension'
    embeds_one :rules, class_name: 'SlicingRules'
  end
end
