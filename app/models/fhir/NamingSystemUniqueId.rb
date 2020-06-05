module FHIR
  class NamingSystemUniqueId < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'NamingSystemUniqueId'
    embeds_one :type, class_name: 'NamingSystemIdentifierType'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    field :preferred, type:  # primitive
    embeds_one :_preferred, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
    embeds_one :period, class_name: 'Period'
  end
end
