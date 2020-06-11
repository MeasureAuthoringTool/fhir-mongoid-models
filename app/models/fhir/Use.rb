module FHIR
  class Use < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Use'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
