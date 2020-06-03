module FHIR
  class Schedule < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Schedule'
    embeds_many :identifier, class_name: 'Identifier'
    field :active, type:  # primitive
    embeds_one :_active, class_name: 'Extension'
    embeds_many :serviceCategory, class_name: 'CodeableConcept'
    embeds_many :serviceType, class_name: 'CodeableConcept'
    embeds_many :specialty, class_name: 'CodeableConcept'
    embeds_many :actor, class_name: 'Reference'
    embeds_one :planningHorizon, class_name: 'Period'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
  end
end
