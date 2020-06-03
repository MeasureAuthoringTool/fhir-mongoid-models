module FHIR
  class MessageHeaderResponse < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageHeaderResponse'
    field :identifier, type:  # primitive
    embeds_one :_identifier, class_name: 'Extension'
    embeds_one :code, class_name: 'ResponseType'
    embeds_one :details, class_name: 'Reference'
  end
end
