module FHIR
  class SequenceType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SequenceType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
