module FHIR
  class RequestIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestIntent'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
