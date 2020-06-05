module FHIR
  class AuditEventAction < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventAction'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
