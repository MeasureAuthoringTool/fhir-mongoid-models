module FHIR
  class Flag < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Flag'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'FlagStatus'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :author, class_name: 'Reference'
  end
end
