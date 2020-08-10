module FHIR
  # fhir/example_scenario_process.rb
  class ExampleScenarioProcess < BackboneElement
    include Mongoid::Document
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :preConditions, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :postConditions, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :step, class_name: 'FHIR::ExampleScenarioProcessStep'    
    
    def as_json(*args)
      result = super      
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.preConditions.nil? 
        result['preConditions'] = self.preConditions.value
        serialized = Extension.serializePrimitiveExtension(self.preConditions)            
        result['_preConditions'] = serialized unless serialized.nil?
      end
      unless self.postConditions.nil? 
        result['postConditions'] = self.postConditions.value
        serialized = Extension.serializePrimitiveExtension(self.postConditions)            
        result['_postConditions'] = serialized unless serialized.nil?
      end
      unless self.step.nil?  || !self.step.any? 
        result['step'] = self.step.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExampleScenarioProcess.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['preConditions'] = PrimitiveMarkdown.transform_json(json_hash['preConditions'], json_hash['_preConditions']) unless json_hash['preConditions'].nil?
      result['postConditions'] = PrimitiveMarkdown.transform_json(json_hash['postConditions'], json_hash['_postConditions']) unless json_hash['postConditions'].nil?
      result['step'] = json_hash['step'].map { |var| ExampleScenarioProcessStep.transform_json(var) } unless json_hash['step'].nil?

      result
    end
  end
end
