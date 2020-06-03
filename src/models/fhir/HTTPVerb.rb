module FHIR
  class HTTPVerb < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'HTTPVerb'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
