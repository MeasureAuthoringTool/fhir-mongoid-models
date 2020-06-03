module FHIR
  class AuditEventAgent < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventAgent'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_many :role, class_name: 'CodeableConcept'
    embeds_one :who, class_name: 'Reference'
    field :altId, type:  # primitive
    embeds_one :_altId, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :requestor, type:  # primitive
    embeds_one :_requestor, class_name: 'Extension'
    embeds_one :location, class_name: 'Reference'
    field :policy, type: Array # primitive
    embeds_many :_policy, class_name: 'Extension'
    embeds_one :media, class_name: 'Coding'
    embeds_one :network, class_name: 'AuditEventAgentNetwork'
    embeds_many :purposeOfUse, class_name: 'CodeableConcept'
  end
end
