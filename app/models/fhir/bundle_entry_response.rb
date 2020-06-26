module FHIR
  # fhir/bundle_entry_response.rb
  class BundleEntryResponse < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleEntryResponse'
    embeds_one :status, class_name: 'PrimitiveString'
    embeds_one :location, class_name: 'PrimitiveUri'
    embeds_one :etag, class_name: 'PrimitiveString'
    embeds_one :lastModified, class_name: 'PrimitiveInstant'
    embeds_one :outcome, class_name: 'Resource'

    def self.transform_json(json_hash)
      result = BundleEntryResponse.new
      result['status'] = PrimitiveString.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?      
      result['location'] = PrimitiveUri.transform_json(json_hash['location'], json_hash['_location']) unless json_hash['location'].nil?      
      result['etag'] = PrimitiveString.transform_json(json_hash['etag'], json_hash['_etag']) unless json_hash['etag'].nil?      
      result['lastModified'] = PrimitiveInstant.transform_json(json_hash['lastModified'], json_hash['_lastModified']) unless json_hash['lastModified'].nil?      
      result['outcome'] = Resource.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      

      result
    end
  end
end
