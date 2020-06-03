module FHIR
  class AuditEventSource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventSource'
    field :site, type:  # primitive
    embeds_one :_site, class_name: 'Extension'
    embeds_one :observer, class_name: 'Reference'
    embeds_many :type, class_name: 'Coding'
  end
end
