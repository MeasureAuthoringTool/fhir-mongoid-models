module FHIR
  # fhir/test_report_test.rb
  class TestReportTest < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :action, class_name: 'FHIR::TestReportTestAction'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.action.nil?  || !self.action.any? 
        result['action'] = self.action.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestReportTest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['action'] = json_hash['action'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          TestReportTestAction.transform_json(var) 
        end
      } unless json_hash['action'].nil?

      result
    end
  end
end
