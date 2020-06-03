module FHIR
  class NamingSystemIdentifierType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NamingSystemIdentifierType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
