module FHIR
  # fhir/medicinal_product_pharmaceutical_route_of_administration_target_species.rb
  class MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :withdrawalPeriod, class_name: 'MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod'

    def self.transform_json(json_hash, target=MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpecies.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['withdrawalPeriod'] = json_hash['withdrawalPeriod'].map { |var| MedicinalProductPharmaceuticalRouteOfAdministrationTargetSpeciesWithdrawalPeriod.transform_json(var) } unless json_hash['withdrawalPeriod'].nil?

      result
    end
  end
end
