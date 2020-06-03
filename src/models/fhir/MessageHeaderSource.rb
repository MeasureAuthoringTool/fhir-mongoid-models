module FHIR
  class MessageHeaderSource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageHeaderSource'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :software, type:  # primitive
    embeds_one :_software, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    embeds_one :contact, class_name: 'ContactPoint'
    field :endpoint, type:  # primitive
    embeds_one :_endpoint, class_name: 'Extension'
  end
end
