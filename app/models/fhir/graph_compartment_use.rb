module FHIR
  # fhir/graph_compartment_use.rb
  class GraphCompartmentUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GraphCompartmentUse'
    field :value, type: String

    def self.transform_json(json_hash)
      result = GraphCompartmentUse.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
