module FHIR
  # fhir/search_entry_mode.rb
  class SearchEntryMode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SearchEntryMode'
    field :value, type: String

    def self.transform_json(json_hash, target=SearchEntryMode.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
