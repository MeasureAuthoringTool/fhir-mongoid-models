module FHIR
  # fhir/medicinal_product_pharmaceutical_route_of_administration.rb
  class MedicinalProductPharmaceuticalRouteOfAdministration < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :firstDose, class_name: 'FHIR::Quantity'    
    embeds_one :maxSingleDose, class_name: 'FHIR::Quantity'    
    embeds_one :maxDosePerDay, class_name: 'FHIR::Quantity'    
    embeds_one :maxDosePerTreatmentPeriod, class_name: 'FHIR::Ratio'    
    embeds_one :maxTreatmentPeriod, class_name: 'FHIR::Duration'    
    embeds_many :targetSpecies, class_name: 'FHIR::MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies'    

    def self.transform_json(json_hash, target = MedicinalProductPharmaceuticalRouteOfAdministration.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['firstDose'] = Quantity.transform_json(json_hash['firstDose']) unless json_hash['firstDose'].nil?
      result['maxSingleDose'] = Quantity.transform_json(json_hash['maxSingleDose']) unless json_hash['maxSingleDose'].nil?
      result['maxDosePerDay'] = Quantity.transform_json(json_hash['maxDosePerDay']) unless json_hash['maxDosePerDay'].nil?
      result['maxDosePerTreatmentPeriod'] = Ratio.transform_json(json_hash['maxDosePerTreatmentPeriod']) unless json_hash['maxDosePerTreatmentPeriod'].nil?
      result['maxTreatmentPeriod'] = Duration.transform_json(json_hash['maxTreatmentPeriod']) unless json_hash['maxTreatmentPeriod'].nil?
      result['targetSpecies'] = json_hash['targetSpecies'].map { |var| MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies.transform_json(var) } unless json_hash['targetSpecies'].nil?

      result
    end
  end
end
