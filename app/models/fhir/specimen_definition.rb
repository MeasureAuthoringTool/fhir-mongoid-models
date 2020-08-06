module FHIR
  # fhir/specimen_definition.rb
  class SpecimenDefinition < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :typeCollected, class_name: 'FHIR::CodeableConcept'    
    embeds_many :patientPreparation, class_name: 'FHIR::CodeableConcept'    
    embeds_one :timeAspect, class_name: 'FHIR::PrimitiveString'    
    embeds_many :_collection, class_name: 'FHIR::CodeableConcept'    
    embeds_many :typeTested, class_name: 'FHIR::SpecimenDefinitionTypeTested'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.typeCollected.nil? 
        result['typeCollected'] = self.typeCollected.as_json(*args)
      end
      unless self.patientPreparation.nil?  || !self.patientPreparation.any? 
        result['patientPreparation'] = self.patientPreparation.map{ |x| x.as_json(*args) }
      end
      unless self.timeAspect.nil? 
        result['timeAspect'] = self.timeAspect.value
        serialized = Extension.serializePrimitiveExtension(self.timeAspect)            
        result['_timeAspect'] = serialized unless serialized.nil?
      end
      unless self.collection.nil?  || !self.collection.any? 
        result['collection'] = self.collection.map{ |x| x.as_json(*args) }
      end
        result['collection'] = result.delete('_collection')
      unless self.typeTested.nil?  || !self.typeTested.any? 
        result['typeTested'] = self.typeTested.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SpecimenDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['typeCollected'] = CodeableConcept.transform_json(json_hash['typeCollected']) unless json_hash['typeCollected'].nil?
      result['patientPreparation'] = json_hash['patientPreparation'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['patientPreparation'].nil?
      result['timeAspect'] = PrimitiveString.transform_json(json_hash['timeAspect'], json_hash['_timeAspect']) unless json_hash['timeAspect'].nil?
      result['_collection'] = json_hash['collection'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['collection'].nil?
      result['typeTested'] = json_hash['typeTested'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SpecimenDefinitionTypeTested.transform_json(var) 
        end
      } unless json_hash['typeTested'].nil?

      result
    end
  end
end
