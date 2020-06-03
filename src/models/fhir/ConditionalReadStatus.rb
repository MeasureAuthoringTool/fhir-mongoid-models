module FHIR
  class ConditionalReadStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConditionalReadStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
