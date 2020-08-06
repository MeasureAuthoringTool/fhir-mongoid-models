module FHIR
  # fhir/medicinal_product_pharmaceutical_route_of_administration_target_species_withdrawal_period.rb
  class MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod < BackboneElement
    include Mongoid::Document
    embeds_one :tissue, class_name: 'FHIR::CodeableConcept'    
    embeds_one :value, class_name: 'FHIR::Quantity'    
    embeds_one :supportingInformation, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.tissue.nil? 
        result['tissue'] = self.tissue.as_json(*args)
      end
      unless self.value.nil? 
        result['value'] = self.value.as_json(*args)
      end
      unless self.supportingInformation.nil? 
        result['supportingInformation'] = self.supportingInformation.value
        serialized = Extension.serializePrimitiveExtension(self.supportingInformation)            
        result['_supportingInformation'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod.new)
      result = self.superclass.transform_json(json_hash, target)
      result['tissue'] = CodeableConcept.transform_json(json_hash['tissue']) unless json_hash['tissue'].nil?
      result['value'] = Quantity.transform_json(json_hash['value']) unless json_hash['value'].nil?
      result['supportingInformation'] = PrimitiveString.transform_json(json_hash['supportingInformation'], json_hash['_supportingInformation']) unless json_hash['supportingInformation'].nil?

      result
    end
  end
end
