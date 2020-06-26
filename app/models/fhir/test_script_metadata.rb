module FHIR
  # fhir/test_script_metadata.rb
  class TestScriptMetadata < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptMetadata'
    embeds_many :link, class_name: 'TestScriptMetadataLink'
    embeds_many :capability, class_name: 'TestScriptMetadataCapability'

    def self.transform_json(json_hash)
      result = TestScriptMetadata.new
      result['link'] = json_hash['link'].map { |var| TestScriptMetadataLink.transform_json(var) } unless json_hash['link'].nil?
      result['capability'] = json_hash['capability'].map { |var| TestScriptMetadataCapability.transform_json(var) } unless json_hash['capability'].nil?

      result
    end
  end
end
