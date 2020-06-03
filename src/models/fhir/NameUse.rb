module FHIR
  class NameUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'NameUse'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
