module FHIR
  class EndpointStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EndpointStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
