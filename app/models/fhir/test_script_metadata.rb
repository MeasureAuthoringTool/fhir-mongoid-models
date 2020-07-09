module FHIR
  # fhir/test_script_metadata.rb
  class TestScriptMetadata < BackboneElement
    include Mongoid::Document
    embeds_many :link, class_name: 'FHIR::TestScriptMetadataLink'
    embeds_many :capability, class_name: 'FHIR::TestScriptMetadataCapability'

    def self.transform_json(json_hash, target = TestScriptMetadata.new)
      result = self.superclass.transform_json(json_hash, target)
      result['link'] = json_hash['link'].map { |var| TestScriptMetadataLink.transform_json(var) } unless json_hash['link'].nil?
      result['capability'] = json_hash['capability'].map { |var| TestScriptMetadataCapability.transform_json(var) } unless json_hash['capability'].nil?

      result
    end
  end
end
