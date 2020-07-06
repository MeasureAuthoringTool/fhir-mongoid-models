module FHIR
  # fhir/consent_policy.rb
  class ConsentPolicy < BackboneElement
    include Mongoid::Document
    embeds_one :authority, class_name: 'PrimitiveUri'
    embeds_one :uri, class_name: 'PrimitiveUri'

    def self.transform_json(json_hash, target = ConsentPolicy.new)
      result = self.superclass.transform_json(json_hash, target)
      result['authority'] = PrimitiveUri.transform_json(json_hash['authority'], json_hash['_authority']) unless json_hash['authority'].nil?      
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?      

      result
    end
  end
end
