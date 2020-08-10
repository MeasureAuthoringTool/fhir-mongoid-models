module FHIR
  # fhir/immunization_recommendation_recommendation.rb
  class ImmunizationRecommendationRecommendation < BackboneElement
    include Mongoid::Document
    embeds_many :vaccineCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :targetDisease, class_name: 'FHIR::CodeableConcept'    
    embeds_many :contraindicatedVaccineCode, class_name: 'FHIR::CodeableConcept'    
    embeds_one :forecastStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_many :forecastReason, class_name: 'FHIR::CodeableConcept'    
    embeds_many :dateCriterion, class_name: 'FHIR::ImmunizationRecommendationRecommendationDateCriterion'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :series, class_name: 'FHIR::PrimitiveString'    
    embeds_one :doseNumberPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :doseNumberString, class_name: 'FHIR::PrimitiveString'    
    embeds_one :seriesDosesPositiveInt, class_name: 'FHIR::PrimitivePositiveInt'    
    embeds_one :seriesDosesString, class_name: 'FHIR::PrimitiveString'    
    embeds_many :supportingImmunization, class_name: 'FHIR::Reference'    
    embeds_many :supportingPatientInformation, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.vaccineCode.nil?  || !self.vaccineCode.any? 
        result['vaccineCode'] = self.vaccineCode.map{ |x| x.as_json(*args) }
      end
      unless self.targetDisease.nil? 
        result['targetDisease'] = self.targetDisease.as_json(*args)
      end
      unless self.contraindicatedVaccineCode.nil?  || !self.contraindicatedVaccineCode.any? 
        result['contraindicatedVaccineCode'] = self.contraindicatedVaccineCode.map{ |x| x.as_json(*args) }
      end
      unless self.forecastStatus.nil? 
        result['forecastStatus'] = self.forecastStatus.as_json(*args)
      end
      unless self.forecastReason.nil?  || !self.forecastReason.any? 
        result['forecastReason'] = self.forecastReason.map{ |x| x.as_json(*args) }
      end
      unless self.dateCriterion.nil?  || !self.dateCriterion.any? 
        result['dateCriterion'] = self.dateCriterion.map{ |x| x.as_json(*args) }
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.series.nil? 
        result['series'] = self.series.value
        serialized = Extension.serializePrimitiveExtension(self.series)            
        result['_series'] = serialized unless serialized.nil?
      end
      unless self.doseNumberPositiveInt.nil?
        result['doseNumberPositiveInt'] = self.doseNumberPositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.doseNumberPositiveInt) 
        result['_doseNumberPositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.doseNumberString.nil?
        result['doseNumberString'] = self.doseNumberString.value                        
        serialized = Extension.serializePrimitiveExtension(self.doseNumberString) 
        result['_doseNumberString'] = serialized unless serialized.nil?
      end          
      unless self.seriesDosesPositiveInt.nil?
        result['seriesDosesPositiveInt'] = self.seriesDosesPositiveInt.value                        
        serialized = Extension.serializePrimitiveExtension(self.seriesDosesPositiveInt) 
        result['_seriesDosesPositiveInt'] = serialized unless serialized.nil?
      end          
      unless self.seriesDosesString.nil?
        result['seriesDosesString'] = self.seriesDosesString.value                        
        serialized = Extension.serializePrimitiveExtension(self.seriesDosesString) 
        result['_seriesDosesString'] = serialized unless serialized.nil?
      end          
      unless self.supportingImmunization.nil?  || !self.supportingImmunization.any? 
        result['supportingImmunization'] = self.supportingImmunization.map{ |x| x.as_json(*args) }
      end
      unless self.supportingPatientInformation.nil?  || !self.supportingPatientInformation.any? 
        result['supportingPatientInformation'] = self.supportingPatientInformation.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImmunizationRecommendationRecommendation.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['vaccineCode'] = json_hash['vaccineCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['vaccineCode'].nil?
      result['targetDisease'] = CodeableConcept.transform_json(json_hash['targetDisease']) unless json_hash['targetDisease'].nil?
      result['contraindicatedVaccineCode'] = json_hash['contraindicatedVaccineCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['contraindicatedVaccineCode'].nil?
      result['forecastStatus'] = CodeableConcept.transform_json(json_hash['forecastStatus']) unless json_hash['forecastStatus'].nil?
      result['forecastReason'] = json_hash['forecastReason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['forecastReason'].nil?
      result['dateCriterion'] = json_hash['dateCriterion'].map { |var| ImmunizationRecommendationRecommendationDateCriterion.transform_json(var) } unless json_hash['dateCriterion'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['series'] = PrimitiveString.transform_json(json_hash['series'], json_hash['_series']) unless json_hash['series'].nil?
      result['doseNumberPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['doseNumberPositiveInt'], json_hash['_doseNumberPositiveInt']) unless json_hash['doseNumberPositiveInt'].nil?
      result['doseNumberString'] = PrimitiveString.transform_json(json_hash['doseNumberString'], json_hash['_doseNumberString']) unless json_hash['doseNumberString'].nil?
      result['seriesDosesPositiveInt'] = PrimitivePositiveInt.transform_json(json_hash['seriesDosesPositiveInt'], json_hash['_seriesDosesPositiveInt']) unless json_hash['seriesDosesPositiveInt'].nil?
      result['seriesDosesString'] = PrimitiveString.transform_json(json_hash['seriesDosesString'], json_hash['_seriesDosesString']) unless json_hash['seriesDosesString'].nil?
      result['supportingImmunization'] = json_hash['supportingImmunization'].map { |var| Reference.transform_json(var) } unless json_hash['supportingImmunization'].nil?
      result['supportingPatientInformation'] = json_hash['supportingPatientInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingPatientInformation'].nil?

      result
    end
  end
end
