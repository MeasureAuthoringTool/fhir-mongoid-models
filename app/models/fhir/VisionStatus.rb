module FHIR
  class VisionStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
