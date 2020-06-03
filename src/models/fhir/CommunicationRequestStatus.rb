module FHIR
  class CommunicationRequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CommunicationRequestStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
