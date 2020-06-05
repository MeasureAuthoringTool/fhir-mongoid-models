module FHIR
  class Bundle < Resource
    include Mongoid::Document
    field :typeName, type: String, default: 'Bundle'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'BundleType'
    field :timestamp, type:  # primitive
    embeds_one :_timestamp, class_name: 'Extension'
    field :total, type:  # primitive
    embeds_one :_total, class_name: 'Extension'
    embeds_many :link, class_name: 'BundleLink'
    embeds_many :entry, class_name: 'BundleEntry'
    embeds_one :signature, class_name: 'Signature'
  end
end
