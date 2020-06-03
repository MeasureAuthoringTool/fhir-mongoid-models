module FHIR
  class MessageHeaderDestination < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageHeaderDestination'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    embeds_one :target, class_name: 'Reference'
    field :endpoint, type:  # primitive
    embeds_one :_endpoint, class_name: 'Extension'
    embeds_one :receiver, class_name: 'Reference'
  end
end
