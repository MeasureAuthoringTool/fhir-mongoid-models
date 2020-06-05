module FHIR
  class SystemRestfulInteraction < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SystemRestfulInteraction'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
