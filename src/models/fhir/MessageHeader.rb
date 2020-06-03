module FHIR
  class MessageHeader < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageHeader'
    embeds_one :eventCoding, class_name: 'Coding'
    field :eventPrimitiveUri, type:  # primitive
    embeds_one :_eventPrimitiveUri, class_name: 'Extension'
    embeds_many :destination, class_name: 'MessageHeaderDestination'
    embeds_one :sender, class_name: 'Reference'
    embeds_one :enterer, class_name: 'Reference'
    embeds_one :author, class_name: 'Reference'
    embeds_one :source, class_name: 'MessageHeaderSource'
    embeds_one :responsible, class_name: 'Reference'
    embeds_one :reason, class_name: 'CodeableConcept'
    embeds_one :response, class_name: 'MessageHeaderResponse'
    embeds_many :focus, class_name: 'Reference'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
  end
end
