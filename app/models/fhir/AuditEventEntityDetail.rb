module FHIR
  class AuditEventEntityDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventEntityDetail'
    field :type, type:  # primitive
    embeds_one :_type, class_name: 'Extension'
    field :valuePrimitiveString, type:  # primitive
    embeds_one :_valuePrimitiveString, class_name: 'Extension'
    field :valuePrimitiveBase64Binary, type:  # primitive
    embeds_one :_valuePrimitiveBase64Binary, class_name: 'Extension'
  end
end
