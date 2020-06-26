module FHIR
  # fhir/bundle_entry_request.rb
  class BundleEntryRequest < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'BundleEntryRequest'
    embeds_one :method, class_name: 'HTTPVerb'
    embeds_one :url, class_name: 'PrimitiveUri'
    embeds_one :ifNoneMatch, class_name: 'PrimitiveString'
    embeds_one :ifModifiedSince, class_name: 'PrimitiveInstant'
    embeds_one :ifMatch, class_name: 'PrimitiveString'
    embeds_one :ifNoneExist, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = BundleEntryRequest.new
      result['method'] = HTTPVerb.transform_json(json_hash['method']) unless json_hash['method'].nil?      
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?      
      result['ifNoneMatch'] = PrimitiveString.transform_json(json_hash['ifNoneMatch'], json_hash['_ifNoneMatch']) unless json_hash['ifNoneMatch'].nil?      
      result['ifModifiedSince'] = PrimitiveInstant.transform_json(json_hash['ifModifiedSince'], json_hash['_ifModifiedSince']) unless json_hash['ifModifiedSince'].nil?      
      result['ifMatch'] = PrimitiveString.transform_json(json_hash['ifMatch'], json_hash['_ifMatch']) unless json_hash['ifMatch'].nil?      
      result['ifNoneExist'] = PrimitiveString.transform_json(json_hash['ifNoneExist'], json_hash['_ifNoneExist']) unless json_hash['ifNoneExist'].nil?      

      result
    end
  end
end
