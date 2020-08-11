module FHIR
  # fhir/code_system_concept.rb
  class CodeSystemConcept < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    
    embeds_one :definition, class_name: 'FHIR::PrimitiveString'    
    embeds_many :designation, class_name: 'FHIR::CodeSystemConceptDesignation'    
    embeds_many :property, class_name: 'FHIR::CodeSystemConceptProperty'    
    embeds_many :concept, class_name: 'FHIR::CodeSystemConcept'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.display.nil? 
        result['display'] = self.display.value
        serialized = Extension.serializePrimitiveExtension(self.display)            
        result['_display'] = serialized unless serialized.nil?
      end
      unless self.definition.nil? 
        result['definition'] = self.definition.value
        serialized = Extension.serializePrimitiveExtension(self.definition)            
        result['_definition'] = serialized unless serialized.nil?
      end
      unless self.designation.nil?  || !self.designation.any? 
        result['designation'] = self.designation.map{ |x| x.as_json(*args) }
      end
      unless self.property.nil?  || !self.property.any? 
        result['property'] = self.property.map{ |x| x.as_json(*args) }
      end
      unless self.concept.nil?  || !self.concept.any? 
        result['concept'] = self.concept.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = CodeSystemConcept.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?
      result['definition'] = PrimitiveString.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?
      result['designation'] = json_hash['designation'].map { |var| CodeSystemConceptDesignation.transform_json(var) } unless json_hash['designation'].nil?
      result['property'] = json_hash['property'].map { |var| CodeSystemConceptProperty.transform_json(var) } unless json_hash['property'].nil?
      result['concept'] = json_hash['concept'].map { |var| CodeSystemConcept.transform_json(var) } unless json_hash['concept'].nil?

      result
    end
  end
end
