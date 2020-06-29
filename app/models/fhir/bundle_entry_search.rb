module FHIR
  # fhir/bundle_entry_search.rb
  class BundleEntrySearch < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleEntrySearch'
    embeds_one :mode, class_name: 'SearchEntryMode'
    embeds_one :score, class_name: 'PrimitiveDecimal'

    def self.transform_json(json_hash, target=BundleEntrySearch.new)
      result = self.superclass.transform_json(json_hash, target)
      result['mode'] = SearchEntryMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['score'] = PrimitiveDecimal.transform_json(json_hash['score'], json_hash['_score']) unless json_hash['score'].nil?      

      result
    end
  end
end
