module FHIR
  # fhir/guide_page_generation.rb
  class GuidePageGeneration < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'GuidePageGeneration'
    field :value, type: String

    def self.transform_json(json_hash)
      result = GuidePageGeneration.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
