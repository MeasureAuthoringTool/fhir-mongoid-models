module FHIR
  # fhir/specimen_container.rb
  class SpecimenContainer < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :capacity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :specimenQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :additiveCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :additiveReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.capacity.nil? 
        result['capacity'] = self.capacity.as_json(*args)
      end
      unless self.specimenQuantity.nil? 
        result['specimenQuantity'] = self.specimenQuantity.as_json(*args)
      end
      unless self.additiveCodeableConcept.nil?
        result['additiveCodeableConcept'] = self.additiveCodeableConcept.as_json(*args)                        
      end          
      unless self.additiveReference.nil?
        result['additiveReference'] = self.additiveReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SpecimenContainer.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Identifier.transform_json(var) 
        end
      } unless json_hash['identifier'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['capacity'] = SimpleQuantity.transform_json(json_hash['capacity']) unless json_hash['capacity'].nil?
      result['specimenQuantity'] = SimpleQuantity.transform_json(json_hash['specimenQuantity']) unless json_hash['specimenQuantity'].nil?
      result['additiveCodeableConcept'] = CodeableConcept.transform_json(json_hash['additiveCodeableConcept']) unless json_hash['additiveCodeableConcept'].nil?
      result['additiveReference'] = Reference.transform_json(json_hash['additiveReference']) unless json_hash['additiveReference'].nil?

      result
    end
  end
end
