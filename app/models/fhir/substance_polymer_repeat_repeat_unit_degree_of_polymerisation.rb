module FHIR
  # fhir/substance_polymer_repeat_repeat_unit_degree_of_polymerisation.rb
  class SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation < BackboneElement
    include Mongoid::Document
    embeds_one :degree, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::SubstanceAmount'    
    
    def as_json(*args)
      result = super      
      unless self.degree.nil? 
        result['degree'] = self.degree.as_json(*args)
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstancePolymerRepeatRepeatUnitDegreeOfPolymerisation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['degree'] = CodeableConcept.transform_json(json_hash['degree']) unless json_hash['degree'].nil?
      result['amount'] = SubstanceAmount.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
