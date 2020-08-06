module FHIR
  # fhir/value_set_compose_include_concept.rb
  class ValueSetComposeIncludeConcept < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    
    embeds_many :designation, class_name: 'FHIR::ValueSetComposeIncludeConceptDesignation'    
    
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
      unless self.designation.nil?  || !self.designation.any? 
        result['designation'] = self.designation.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ValueSetComposeIncludeConcept.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?
      result['designation'] = json_hash['designation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ValueSetComposeIncludeConceptDesignation.transform_json(var) 
        end
      } unless json_hash['designation'].nil?

      result
    end
  end
end
