module FHIR
  # fhir/graph_compartment_rule.rb
  class GraphCompartmentRule < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GraphCompartmentRule'
    field :value, type: String

    def self.transform_json(json_hash)
      result = GraphCompartmentRule.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
