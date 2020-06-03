module FHIR
  class CompartmentCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'CompartmentCode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
