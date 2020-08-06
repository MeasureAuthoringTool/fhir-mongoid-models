module FHIR
  # fhir/medicinal_product_contraindication.rb
  class MedicinalProductContraindication < DomainResource
    include Mongoid::Document
    embeds_many :subject, class_name: 'FHIR::Reference'    
    embeds_one :disease, class_name: 'FHIR::CodeableConcept'    
    embeds_one :diseaseStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_many :comorbidity, class_name: 'FHIR::CodeableConcept'    
    embeds_many :therapeuticIndication, class_name: 'FHIR::Reference'    
    embeds_many :otherTherapy, class_name: 'FHIR::MedicinalProductContraindicationOtherTherapy'    
    embeds_many :population, class_name: 'FHIR::Population'    
    
    def as_json(*args)
      result = super      
      unless self.subject.nil?  || !self.subject.any? 
        result['subject'] = self.subject.map{ |x| x.as_json(*args) }
      end
      unless self.disease.nil? 
        result['disease'] = self.disease.as_json(*args)
      end
      unless self.diseaseStatus.nil? 
        result['diseaseStatus'] = self.diseaseStatus.as_json(*args)
      end
      unless self.comorbidity.nil?  || !self.comorbidity.any? 
        result['comorbidity'] = self.comorbidity.map{ |x| x.as_json(*args) }
      end
      unless self.therapeuticIndication.nil?  || !self.therapeuticIndication.any? 
        result['therapeuticIndication'] = self.therapeuticIndication.map{ |x| x.as_json(*args) }
      end
      unless self.otherTherapy.nil?  || !self.otherTherapy.any? 
        result['otherTherapy'] = self.otherTherapy.map{ |x| x.as_json(*args) }
      end
      unless self.population.nil?  || !self.population.any? 
        result['population'] = self.population.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductContraindication.new)
      result = self.superclass.transform_json(json_hash, target)
      result['subject'] = json_hash['subject'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['subject'].nil?
      result['disease'] = CodeableConcept.transform_json(json_hash['disease']) unless json_hash['disease'].nil?
      result['diseaseStatus'] = CodeableConcept.transform_json(json_hash['diseaseStatus']) unless json_hash['diseaseStatus'].nil?
      result['comorbidity'] = json_hash['comorbidity'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          CodeableConcept.transform_json(var) 
        end
      } unless json_hash['comorbidity'].nil?
      result['therapeuticIndication'] = json_hash['therapeuticIndication'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Reference.transform_json(var) 
        end
      } unless json_hash['therapeuticIndication'].nil?
      result['otherTherapy'] = json_hash['otherTherapy'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductContraindicationOtherTherapy.transform_json(var) 
        end
      } unless json_hash['otherTherapy'].nil?
      result['population'] = json_hash['population'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Population.transform_json(var) 
        end
      } unless json_hash['population'].nil?

      result
    end
  end
end
