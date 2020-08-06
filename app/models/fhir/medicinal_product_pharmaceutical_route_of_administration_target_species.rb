module FHIR
  # fhir/medicinal_product_pharmaceutical_route_of_administration_target_species.rb
  class MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :withdrawalPeriod, class_name: 'FHIR::MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.withdrawalPeriod.nil?  || !self.withdrawalPeriod.any? 
        result['withdrawalPeriod'] = self.withdrawalPeriod.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['withdrawalPeriod'] = json_hash['withdrawalPeriod'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod.transform_json(var) 
        end
      } unless json_hash['withdrawalPeriod'].nil?

      result
    end
  end
end
