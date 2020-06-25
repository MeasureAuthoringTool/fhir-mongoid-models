module FHIR
  # fhir/search_modifier_code.rb
  class SearchModifierCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchModifierCode'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SearchModifierCode.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
