module FHIR
  class ImplementationGuideGlobal < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideGlobal'
    embeds_one :type, class_name: 'ResourceType'
    field :profile, type:  # primitive
    embeds_one :_profile, class_name: 'Extension'
  end
end
