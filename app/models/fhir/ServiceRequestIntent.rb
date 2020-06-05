module FHIR
  class ServiceRequestIntent < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ServiceRequestIntent'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
