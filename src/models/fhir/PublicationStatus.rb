module FHIR
  class PublicationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'PublicationStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
