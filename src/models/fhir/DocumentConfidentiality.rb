module FHIR
  class DocumentConfidentiality < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DocumentConfidentiality'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
