module FHIR
  class VisionEyes < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'VisionEyes'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
