module FHIR
  # fhir/test_script_metadata_capability.rb
  class TestScriptMetadataCapability < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptMetadataCapability'
    embeds_one :required, class_name: 'PrimitiveBoolean'
    embeds_one :_validated, class_name: 'PrimitiveBoolean'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_many :origin, class_name: 'PrimitiveInteger'
    embeds_one :destination, class_name: 'PrimitiveInteger'
    embeds_many :link, class_name: 'PrimitiveUri'
    embeds_one :capabilities, class_name: 'PrimitiveCanonical'
    
    def as_json(*args)
      res = super
      res['validated'] = res.delete('_validated')
      res
    end

    def self.transform_json(json_hash, target=TestScriptMetadataCapability.new)
      result = self.superclass.transform_json(json_hash, target)
      result['required'] = PrimitiveBoolean.transform_json(json_hash['required'], json_hash['_required']) unless json_hash['required'].nil?      
      result['_validated'] = PrimitiveBoolean.transform_json(json_hash['validated'], json_hash['_validated']) unless json_hash['validated'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['origin'] = json_hash['origin'].each_with_index.map do |var, i|
        extension_hash = json_hash['_origin'] && json_hash['_origin'][i]
        PrimitiveInteger.transform_json(var, extension_hash)
      end unless json_hash['origin'].nil?
      result['destination'] = PrimitiveInteger.transform_json(json_hash['destination'], json_hash['_destination']) unless json_hash['destination'].nil?      
      result['link'] = json_hash['link'].each_with_index.map do |var, i|
        extension_hash = json_hash['_link'] && json_hash['_link'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['link'].nil?
      result['capabilities'] = PrimitiveCanonical.transform_json(json_hash['capabilities'], json_hash['_capabilities']) unless json_hash['capabilities'].nil?      

      result
    end
  end
end
