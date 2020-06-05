module FHIR
  class AuditEventAgentNetwork < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventAgentNetwork'
    field :address, type:  # primitive
    embeds_one :_address, class_name: 'Extension'
    embeds_one :type, class_name: 'AuditEventAgentNetworkType'
  end
end
