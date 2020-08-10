module FHIR
  # fhir/insurance_plan_plan.rb
  class InsurancePlanPlan < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_many :coverageArea, class_name: 'FHIR::Reference'    
    embeds_many :network, class_name: 'FHIR::Reference'    
    embeds_many :generalCost, class_name: 'FHIR::InsurancePlanPlanGeneralCost'    
    embeds_many :specificCost, class_name: 'FHIR::InsurancePlanPlanSpecificCost'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.coverageArea.nil?  || !self.coverageArea.any? 
        result['coverageArea'] = self.coverageArea.map{ |x| x.as_json(*args) }
      end
      unless self.network.nil?  || !self.network.any? 
        result['network'] = self.network.map{ |x| x.as_json(*args) }
      end
      unless self.generalCost.nil?  || !self.generalCost.any? 
        result['generalCost'] = self.generalCost.map{ |x| x.as_json(*args) }
      end
      unless self.specificCost.nil?  || !self.specificCost.any? 
        result['specificCost'] = self.specificCost.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = InsurancePlanPlan.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['coverageArea'] = json_hash['coverageArea'].map { |var| Reference.transform_json(var) } unless json_hash['coverageArea'].nil?
      result['network'] = json_hash['network'].map { |var| Reference.transform_json(var) } unless json_hash['network'].nil?
      result['generalCost'] = json_hash['generalCost'].map { |var| InsurancePlanPlanGeneralCost.transform_json(var) } unless json_hash['generalCost'].nil?
      result['specificCost'] = json_hash['specificCost'].map { |var| InsurancePlanPlanSpecificCost.transform_json(var) } unless json_hash['specificCost'].nil?

      result
    end
  end
end
