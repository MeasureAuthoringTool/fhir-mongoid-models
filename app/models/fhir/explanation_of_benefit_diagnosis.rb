module FHIR
  # fhir/explanation_of_benefit_diagnosis.rb
  class ExplanationOfBenefitDiagnosis < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :diagnosisCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :diagnosisReference, class_name: 'FHIR::Reference'    
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :onAdmission, class_name: 'FHIR::CodeableConcept'    
    embeds_one :packageCode, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.sequence.nil? 
        result['sequence'] = self.sequence.value
        serialized = Extension.serializePrimitiveExtension(self.sequence)            
        result['_sequence'] = serialized unless serialized.nil?
      end
      unless self.diagnosisCodeableConcept.nil?
        result['diagnosisCodeableConcept'] = self.diagnosisCodeableConcept.as_json(*args)                        
      end          
      unless self.diagnosisReference.nil?
        result['diagnosisReference'] = self.diagnosisReference.as_json(*args)                        
      end          
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.onAdmission.nil? 
        result['onAdmission'] = self.onAdmission.as_json(*args)
      end
      unless self.packageCode.nil? 
        result['packageCode'] = self.packageCode.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ExplanationOfBenefitDiagnosis.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?
      result['diagnosisCodeableConcept'] = CodeableConcept.transform_json(json_hash['diagnosisCodeableConcept']) unless json_hash['diagnosisCodeableConcept'].nil?
      result['diagnosisReference'] = Reference.transform_json(json_hash['diagnosisReference']) unless json_hash['diagnosisReference'].nil?
      result['type'] = json_hash['type'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['type'].nil?
      result['onAdmission'] = CodeableConcept.transform_json(json_hash['onAdmission']) unless json_hash['onAdmission'].nil?
      result['packageCode'] = CodeableConcept.transform_json(json_hash['packageCode']) unless json_hash['packageCode'].nil?

      result
    end
  end
end
