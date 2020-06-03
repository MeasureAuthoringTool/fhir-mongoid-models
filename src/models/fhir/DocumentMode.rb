module FHIR
  class DocumentMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentMode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
