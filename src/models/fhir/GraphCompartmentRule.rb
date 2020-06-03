module FHIR
  class GraphCompartmentRule < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GraphCompartmentRule'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
