module FHIR
  # fhir/medication_knowledge_kinetics.rb
  class MedicationKnowledgeKinetics < BackboneElement
    include Mongoid::Document
    embeds_many :areaUnderCurve, class_name: 'FHIR::SimpleQuantity'    
    embeds_many :lethalDose50, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :halfLifePeriod, class_name: 'FHIR::Duration'    
    
    def as_json(*args)
      result = super      
      unless self.areaUnderCurve.nil?  || !self.areaUnderCurve.any? 
        result['areaUnderCurve'] = self.areaUnderCurve.map{ |x| x.as_json(*args) }
      end
      unless self.lethalDose50.nil?  || !self.lethalDose50.any? 
        result['lethalDose50'] = self.lethalDose50.map{ |x| x.as_json(*args) }
      end
      unless self.halfLifePeriod.nil? 
        result['halfLifePeriod'] = self.halfLifePeriod.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationKnowledgeKinetics.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['areaUnderCurve'] = json_hash['areaUnderCurve'].map { |var| SimpleQuantity.transform_json(var) } unless json_hash['areaUnderCurve'].nil?
      result['lethalDose50'] = json_hash['lethalDose50'].map { |var| SimpleQuantity.transform_json(var) } unless json_hash['lethalDose50'].nil?
      result['halfLifePeriod'] = Duration.transform_json(json_hash['halfLifePeriod']) unless json_hash['halfLifePeriod'].nil?

      result
    end
  end
end
