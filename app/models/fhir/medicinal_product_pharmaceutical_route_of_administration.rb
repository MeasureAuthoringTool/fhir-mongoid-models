module FHIR
  # fhir/medicinal_product_pharmaceutical_route_of_administration.rb
  class MedicinalProductPharmaceuticalRouteOfAdministration < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceuticalRouteOfAdministration'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :firstDose, class_name: 'Quantity'
    embeds_one :maxSingleDose, class_name: 'Quantity'
    embeds_one :maxDosePerDay, class_name: 'Quantity'
    embeds_one :maxDosePerTreatmentPeriod, class_name: 'Ratio'
    embeds_one :maxTreatmentPeriod, class_name: 'Duration'
    embeds_many :targetSpecies, class_name: 'MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies'

    def self.transform_json(json_hash)
      result = MedicinalProductPharmaceuticalRouteOfAdministration.new
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
