module FHIR
  class TestScriptMetadataLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptMetadataLink'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
  end
end
