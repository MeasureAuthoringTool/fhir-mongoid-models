module FHIR
  # fhir/test_script_teardown.rb
  class TestScriptTeardown < BackboneElement
    include Mongoid::Document
    embeds_many :action, class_name: 'FHIR::TestScriptTeardownAction'    
    
    def as_json(*args)
      result = super      
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

    def self.transform_json(json_hash, target = TestScriptTeardown.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = json_hash['action'].map { |var| TestScriptTeardownAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
