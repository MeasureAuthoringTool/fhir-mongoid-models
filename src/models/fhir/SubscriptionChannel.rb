module FHIR
  class SubscriptionChannel < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubscriptionChannel'
    embeds_one :type, class_name: 'SubscriptionChannelType'
    field :endpoint, type:  # primitive
    embeds_one :_endpoint, class_name: 'Extension'
    embeds_one :payload, class_name: 'MimeType'
    field :header, type: Array # primitive
    embeds_many :_header, class_name: 'Extension'
  end
end
