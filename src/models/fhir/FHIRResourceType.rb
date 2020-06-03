module FHIR
  class FHIRResourceType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'FHIRResourceType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
