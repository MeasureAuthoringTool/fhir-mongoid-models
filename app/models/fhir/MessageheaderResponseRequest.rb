module FHIR
  class MessageheaderResponseRequest < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageheaderResponseRequest'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
