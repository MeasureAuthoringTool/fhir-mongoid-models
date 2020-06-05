module FHIR
  class AuditEventAgentNetworkType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'AuditEventAgentNetworkType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
