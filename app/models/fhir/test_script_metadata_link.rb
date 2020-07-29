module FHIR
  # fhir/test_script_metadata_link.rb
  class TestScriptMetadataLink < BackboneElement
    include Mongoid::Document
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = TestScriptMetadataLink.new)
      result = self.superclass.transform_json(json_hash, target)
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?

      result
    end
  end
end
