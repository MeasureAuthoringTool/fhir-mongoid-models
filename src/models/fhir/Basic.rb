module FHIR
  class Basic < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Basic'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    field :created, type:  # primitive
    embeds_one :_created, class_name: 'Extension'
    embeds_one :author, class_name: 'Reference'
  end
end
