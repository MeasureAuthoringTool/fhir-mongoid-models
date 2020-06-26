module FHIR
  # fhir/search_comparator.rb
  class SearchComparator < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchComparator'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SearchComparator.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
