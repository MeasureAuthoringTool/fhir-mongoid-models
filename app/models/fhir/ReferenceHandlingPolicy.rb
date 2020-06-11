module FHIR
  class ReferenceHandlingPolicy < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ReferenceHandlingPolicy'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
