module FHIR
  # fhir/bundle_link.rb
  class BundleLink < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleLink'
    embeds_one :relation, class_name: 'PrimitiveString'
    embeds_one :url, class_name: 'PrimitiveUri'

    def self.transform_json(json_hash, target=BundleLink.new)
      result = self.superclass.transform_json(json_hash, target)
      result['relation'] = PrimitiveString.transform_json(json_hash['relation'], json_hash['_relation']) unless json_hash['relation'].nil?      
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      

      result
    end
  end
end
