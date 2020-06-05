module FHIR
  class CommunicationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
