module FHIR
  class GraphCompartmentUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GraphCompartmentUse'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
