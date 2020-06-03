module FHIR
  class CapabilityStatementDocument < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementDocument'
    embeds_one :mode, class_name: 'DocumentMode'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
    field :profile, type:  # primitive
    embeds_one :_profile, class_name: 'Extension'
  end
end
