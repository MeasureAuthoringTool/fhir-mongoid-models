module FHIR
  # fhir/concept_map_group_unmapped_mode.rb
  class ConceptMapGroupUnmappedMode < Element
    include Mongoid::Document
    field :value, type: String    

    def self.transform_json(json_hash, target = ConceptMapGroupUnmappedMode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
