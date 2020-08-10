module FHIR
  # fhir/specimen_definition_type_tested_container.rb
  class SpecimenDefinitionTypeTestedContainer < BackboneElement
    include Mongoid::Document
    embeds_one :material, class_name: 'FHIR::CodeableConcept'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :cap, class_name: 'FHIR::CodeableConcept'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :capacity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :minimumVolumeSimpleQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :minimumVolumeString, class_name: 'FHIR::PrimitiveString'    
    embeds_many :additive, class_name: 'FHIR::SpecimenDefinitionTypeTestedContainerAdditive'    
    embeds_one :preparation, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.material.nil? 
        result['material'] = self.material.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.cap.nil? 
        result['cap'] = self.cap.as_json(*args)
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.capacity.nil? 
        result['capacity'] = self.capacity.as_json(*args)
      end
      unless self.minimumVolumeSimpleQuantity.nil?
        result['minimumVolumeSimpleQuantity'] = self.minimumVolumeSimpleQuantity.as_json(*args)                        
      end          
      unless self.minimumVolumeString.nil?
        result['minimumVolumeString'] = self.minimumVolumeString.value                        
        serialized = Extension.serializePrimitiveExtension(self.minimumVolumeString) 
        result['_minimumVolumeString'] = serialized unless serialized.nil?
      end          
      unless self.additive.nil?  || !self.additive.any? 
        result['additive'] = self.additive.map{ |x| x.as_json(*args) }
      end
      unless self.preparation.nil? 
        result['preparation'] = self.preparation.value
        serialized = Extension.serializePrimitiveExtension(self.preparation)            
        result['_preparation'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SpecimenDefinitionTypeTestedContainer.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['material'] = CodeableConcept.transform_json(json_hash['material']) unless json_hash['material'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['cap'] = CodeableConcept.transform_json(json_hash['cap']) unless json_hash['cap'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['capacity'] = SimpleQuantity.transform_json(json_hash['capacity']) unless json_hash['capacity'].nil?
      result['minimumVolumeSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['minimumVolumeSimpleQuantity']) unless json_hash['minimumVolumeSimpleQuantity'].nil?
      result['minimumVolumeString'] = PrimitiveString.transform_json(json_hash['minimumVolumeString'], json_hash['_minimumVolumeString']) unless json_hash['minimumVolumeString'].nil?
      result['additive'] = json_hash['additive'].map { |var| SpecimenDefinitionTypeTestedContainerAdditive.transform_json(var) } unless json_hash['additive'].nil?
      result['preparation'] = PrimitiveString.transform_json(json_hash['preparation'], json_hash['_preparation']) unless json_hash['preparation'].nil?

      result
    end
  end
end
