module FHIR
  class ConditionalDeleteStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConditionalDeleteStatus'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
