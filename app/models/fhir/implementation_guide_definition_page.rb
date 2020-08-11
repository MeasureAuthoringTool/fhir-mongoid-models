module FHIR
  # fhir/implementation_guide_definition_page.rb
  class ImplementationGuideDefinitionPage < BackboneElement
    include Mongoid::Document
    embeds_one :nameUrl, class_name: 'FHIR::PrimitiveUrl'    
    embeds_one :nameReference, class_name: 'FHIR::Reference'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :generation, class_name: 'FHIR::GuidePageGeneration'    
    embeds_many :page, class_name: 'FHIR::ImplementationGuideDefinitionPage'    
    
    def as_json(*args)
      result = super      
      unless self.nameUrl.nil?
        result['nameUrl'] = self.nameUrl.value                        
        serialized = Extension.serializePrimitiveExtension(self.nameUrl) 
        result['_nameUrl'] = serialized unless serialized.nil?
      end          
      unless self.nameReference.nil?
        result['nameReference'] = self.nameReference.as_json(*args)                        
      end          
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.generation.nil? 
        result['generation'] = self.generation.value
        serialized = Extension.serializePrimitiveExtension(self.generation)            
        result['_generation'] = serialized unless serialized.nil?
      end
      unless self.page.nil?  || !self.page.any? 
        result['page'] = self.page.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuideDefinitionPage.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['nameUrl'] = PrimitiveUrl.transform_json(json_hash['nameUrl'], json_hash['_nameUrl']) unless json_hash['nameUrl'].nil?
      result['nameReference'] = Reference.transform_json(json_hash['nameReference']) unless json_hash['nameReference'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['generation'] = GuidePageGeneration.transform_json(json_hash['generation'], json_hash['_generation']) unless json_hash['generation'].nil?
      result['page'] = json_hash['page'].map { |var| ImplementationGuideDefinitionPage.transform_json(var) } unless json_hash['page'].nil?

      result
    end
  end
end
