module FHIR
  class RequestPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestPriority'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
