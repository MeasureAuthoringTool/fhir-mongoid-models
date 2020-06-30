module FHIR
  # fhir/medicinal_product_pharmaceutical_route_of_administration_target_species_withdrawal_period.rb
  class MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod'
    embeds_one :tissue, class_name: 'CodeableConcept'
    embeds_one :value, class_name: 'Quantity'
    embeds_one :supportingInformation, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod.new)
      result = self.superclass.transform_json(json_hash, target)
      result['tissue'] = CodeableConcept.transform_json(json_hash['tissue']) unless json_hash['tissue'].nil?      
      result['value'] = Quantity.transform_json(json_hash['value']) unless json_hash['value'].nil?      
      result['supportingInformation'] = PrimitiveString.transform_json(json_hash['supportingInformation'], json_hash['_supportingInformation']) unless json_hash['supportingInformation'].nil?      

      result
    end
  end
end
