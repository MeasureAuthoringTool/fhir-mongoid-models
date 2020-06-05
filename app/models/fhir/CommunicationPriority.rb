module FHIR
  class CommunicationPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationPriority'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
