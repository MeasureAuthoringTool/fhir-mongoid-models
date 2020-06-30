module FHIR
  # fhir/concept_map_equivalence.rb
  class ConceptMapEquivalence < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ConceptMapEquivalence'
    field :value, type: String

    def self.transform_json(json_hash, target=ConceptMapEquivalence.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
