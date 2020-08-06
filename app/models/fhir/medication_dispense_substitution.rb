module FHIR
  # fhir/medication_dispense_substitution.rb
  class MedicationDispenseSubstitution < BackboneElement
    include Mongoid::Document
    embeds_one :wasSubstituted, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reason, class_name: 'FHIR::CodeableConcept'    
    embeds_many :responsibleParty, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.wasSubstituted.nil? 
        result['wasSubstituted'] = self.wasSubstituted.value
        serialized = Extension.serializePrimitiveExtension(self.wasSubstituted)            
        result['_wasSubstituted'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.reason.nil?  || !self.reason.any? 
        result['reason'] = self.reason.map{ |x| x.as_json(*args) }
      end
      unless self.responsibleParty.nil?  || !self.responsibleParty.any? 
        result['responsibleParty'] = self.responsibleParty.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationDispenseSubstitution.new)
      result = self.superclass.transform_json(json_hash, target)
      result['wasSubstituted'] = PrimitiveBoolean.transform_json(json_hash['wasSubstituted'], json_hash['_wasSubstituted']) unless json_hash['wasSubstituted'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['reason'] = json_hash['reason'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['reason'].nil?
      result['responsibleParty'] = json_hash['responsibleParty'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['responsibleParty'].nil?

      result
    end
  end
end
