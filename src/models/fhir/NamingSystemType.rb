module FHIR
  class NamingSystemType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NamingSystemType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
