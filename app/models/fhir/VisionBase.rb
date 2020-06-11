module FHIR
  class VisionBase < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionBase'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
