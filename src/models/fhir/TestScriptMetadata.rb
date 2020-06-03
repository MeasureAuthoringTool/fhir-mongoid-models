module FHIR
  class TestScriptMetadata < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptMetadata'
    embeds_many :link, class_name: 'TestScriptMetadataLink'
    embeds_many :capability, class_name: 'TestScriptMetadataCapability'
  end
end
