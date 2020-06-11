module FHIR
  class GroupType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GroupType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
