module FHIR
  class Subscription < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Subscription'
    embeds_one :status, class_name: 'SubscriptionStatus'
    embeds_many :contact, class_name: 'ContactPoint'
    field :end, type:  # primitive
    embeds_one :_end, class_name: 'Extension'
    field :reason, type:  # primitive
    embeds_one :_reason, class_name: 'Extension'
    field :criteria, type:  # primitive
    embeds_one :_criteria, class_name: 'Extension'
    field :error, type:  # primitive
    embeds_one :_error, class_name: 'Extension'
    embeds_one :channel, class_name: 'SubscriptionChannel'
  end
end
