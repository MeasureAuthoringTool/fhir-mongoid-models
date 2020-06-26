module FHIR
  # fhir/search_param_type.rb
  class SearchParamType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchParamType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = SearchParamType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
