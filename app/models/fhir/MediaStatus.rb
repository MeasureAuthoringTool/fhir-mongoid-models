module FHIR
  class MediaStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MediaStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
