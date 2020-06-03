module FHIR
  class LinkType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'LinkType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
