module FHIR
  # fhir/specimen_definition_type_tested.rb
  class SpecimenDefinitionTypeTested < BackboneElement
    include Mongoid::Document
    embeds_one :isDerived, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :preference, class_name: 'FHIR::SpecimenContainedPreference'    
    embeds_one :container, class_name: 'FHIR::SpecimenDefinitionTypeTestedContainer'    
    embeds_one :requirement, class_name: 'FHIR::PrimitiveString'    
    embeds_one :retentionTime, class_name: 'FHIR::Duration'    
    embeds_many :rejectionCriterion, class_name: 'FHIR::CodeableConcept'    
    embeds_many :handling, class_name: 'FHIR::SpecimenDefinitionTypeTestedHandling'    
    
    def as_json(*args)
      result = super      
      unless self.isDerived.nil? 
        result['isDerived'] = self.isDerived.value
        serialized = Extension.serializePrimitiveExtension(self.isDerived)            
        result['_isDerived'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.preference.nil? 
        result['preference'] = self.preference.value
        serialized = Extension.serializePrimitiveExtension(self.preference)            
        result['_preference'] = serialized unless serialized.nil?
      end
      unless self.container.nil? 
        result['container'] = self.container.as_json(*args)
      end
      unless self.requirement.nil? 
        result['requirement'] = self.requirement.value
        serialized = Extension.serializePrimitiveExtension(self.requirement)            
        result['_requirement'] = serialized unless serialized.nil?
      end
      unless self.retentionTime.nil? 
        result['retentionTime'] = self.retentionTime.as_json(*args)
      end
      unless self.rejectionCriterion.nil?  || !self.rejectionCriterion.any? 
        result['rejectionCriterion'] = self.rejectionCriterion.map{ |x| x.as_json(*args) }
      end
      unless self.handling.nil?  || !self.handling.any? 
        result['handling'] = self.handling.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SpecimenDefinitionTypeTested.new)
      result = self.superclass.transform_json(json_hash, target)
      result['isDerived'] = PrimitiveBoolean.transform_json(json_hash['isDerived'], json_hash['_isDerived']) unless json_hash['isDerived'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['preference'] = SpecimenContainedPreference.transform_json(json_hash['preference'], json_hash['_preference']) unless json_hash['preference'].nil?
      result['container'] = SpecimenDefinitionTypeTestedContainer.transform_json(json_hash['container']) unless json_hash['container'].nil?
      result['requirement'] = PrimitiveString.transform_json(json_hash['requirement'], json_hash['_requirement']) unless json_hash['requirement'].nil?
      result['retentionTime'] = Duration.transform_json(json_hash['retentionTime']) unless json_hash['retentionTime'].nil?
      result['rejectionCriterion'] = json_hash['rejectionCriterion'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['rejectionCriterion'].nil?
      result['handling'] = json_hash['handling'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SpecimenDefinitionTypeTestedHandling.transform_json(var) 
        end
      } unless json_hash['handling'].nil?

      result
    end
  end
end
