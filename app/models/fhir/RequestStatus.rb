module FHIR
  class RequestStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
