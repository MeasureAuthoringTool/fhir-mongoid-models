module FHIR
  class ConsentState < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConsentState'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
