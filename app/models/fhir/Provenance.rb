module FHIR
  class Provenance < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Provenance'
    embeds_many :target, class_name: 'Reference'
    embeds_one :occurredPeriod, class_name: 'Period'
    field :occurredPrimitiveDateTime, type:  # primitive
    embeds_one :_occurredPrimitiveDateTime, class_name: 'Extension'
    field :recorded, type:  # primitive
    embeds_one :_recorded, class_name: 'Extension'
    field :policy, type: Array # primitive
    embeds_many :_policy, class_name: 'Extension'
    embeds_one :location, class_name: 'Reference'
    embeds_many :reason, class_name: 'CodeableConcept'
    embeds_one :activity, class_name: 'CodeableConcept'
    embeds_many :agent, class_name: 'ProvenanceAgent'
    embeds_many :entity, class_name: 'ProvenanceEntity'
    embeds_many :signature, class_name: 'Signature'
  end
end
