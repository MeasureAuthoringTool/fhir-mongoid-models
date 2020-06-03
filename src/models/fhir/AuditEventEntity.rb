module FHIR
  class AuditEventEntity < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventEntity'
    embeds_one :what, class_name: 'Reference'
    embeds_one :type, class_name: 'Coding'
    embeds_one :role, class_name: 'Coding'
    embeds_one :lifecycle, class_name: 'Coding'
    embeds_many :securityLabel, class_name: 'Coding'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :query, type:  # primitive
    embeds_one :_query, class_name: 'Extension'
    embeds_many :detail, class_name: 'AuditEventEntityDetail'
  end
end
