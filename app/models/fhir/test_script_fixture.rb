module FHIR
  # fhir/test_script_fixture.rb
  class TestScriptFixture < BackboneElement
    include Mongoid::Document
    embeds_one :autocreate, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :autodelete, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :resource, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.autocreate.nil? 
        result['autocreate'] = self.autocreate.value
        serialized = Extension.serializePrimitiveExtension(self.autocreate)            
        result['_autocreate'] = serialized unless serialized.nil?
      end
      unless self.autodelete.nil? 
        result['autodelete'] = self.autodelete.value
        serialized = Extension.serializePrimitiveExtension(self.autodelete)            
        result['_autodelete'] = serialized unless serialized.nil?
      end
      unless self.resource.nil? 
        result['resource'] = self.resource.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestScriptFixture.new)
      result = self.superclass.transform_json(json_hash, target)
      result['autocreate'] = PrimitiveBoolean.transform_json(json_hash['autocreate'], json_hash['_autocreate']) unless json_hash['autocreate'].nil?
      result['autodelete'] = PrimitiveBoolean.transform_json(json_hash['autodelete'], json_hash['_autodelete']) unless json_hash['autodelete'].nil?
      result['resource'] = Reference.transform_json(json_hash['resource']) unless json_hash['resource'].nil?

      result
    end
  end
end
