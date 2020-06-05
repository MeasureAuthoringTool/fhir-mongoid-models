module FHIR
  class ElementDefinitionType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionType'
    field :code, type:  # primitive
    embeds_one :_code, class_name: 'Extension'
    field :targetProfile, type: Array # primitive
    embeds_many :_targetProfile, class_name: 'Extension'
    embeds_one :versioning, class_name: 'ReferenceVersionRules'
  end
end
