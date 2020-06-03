module FHIR
  class TestScriptMetadataCapability < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptMetadataCapability'
    field :required, type:  # primitive
    embeds_one :_required, class_name: 'Extension'
    field :validated, type:  # primitive
    embeds_one :_validated, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :origin, type: Array # primitive
    embeds_many :_origin, class_name: 'Extension'
    field :destination, type:  # primitive
    embeds_one :_destination, class_name: 'Extension'
    field :link, type: Array # primitive
    embeds_many :_link, class_name: 'Extension'
    field :capabilities, type:  # primitive
    embeds_one :_capabilities, class_name: 'Extension'
  end
end
