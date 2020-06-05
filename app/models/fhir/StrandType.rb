module FHIR
  class StrandType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'StrandType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
