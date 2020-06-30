module FHIR
  # fhir/research_element_type.rb
  class ResearchElementType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ResearchElementType'
    field :value, type: String

    def self.transform_json(json_hash, target=ResearchElementType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
