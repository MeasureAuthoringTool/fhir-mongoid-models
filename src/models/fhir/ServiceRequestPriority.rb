module FHIR
  class ServiceRequestPriority < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ServiceRequestPriority'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
