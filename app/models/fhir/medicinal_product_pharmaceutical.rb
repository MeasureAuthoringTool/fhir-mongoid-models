module FHIR
  # fhir/medicinal_product_pharmaceutical.rb
  class MedicinalProductPharmaceutical < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceutical'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :administrableDoseForm, class_name: 'CodeableConcept'
    embeds_one :unitOfPresentation, class_name: 'CodeableConcept'
    embeds_many :ingredient, class_name: 'Reference'
    embeds_many :device, class_name: 'Reference'
    embeds_many :characteristics, class_name: 'MedicinalProductPharmaceuticalCharacteristics'
    embeds_many :routeOfAdministration, class_name: 'MedicinalProductPharmaceuticalRouteOfAdministration'

    def self.transform_json(json_hash, target=MedicinalProductPharmaceutical.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['administrableDoseForm'] = CodeableConcept.transform_json(json_hash['administrableDoseForm']) unless json_hash['administrableDoseForm'].nil?      
      result['unitOfPresentation'] = CodeableConcept.transform_json(json_hash['unitOfPresentation']) unless json_hash['unitOfPresentation'].nil?      
      result['ingredient'] = json_hash['ingredient'].map { |var| Reference.transform_json(var) } unless json_hash['ingredient'].nil?
      result['device'] = json_hash['device'].map { |var| Reference.transform_json(var) } unless json_hash['device'].nil?
      result['characteristics'] = json_hash['characteristics'].map { |var| MedicinalProductPharmaceuticalCharacteristics.transform_json(var) } unless json_hash['characteristics'].nil?
      result['routeOfAdministration'] = json_hash['routeOfAdministration'].map { |var| MedicinalProductPharmaceuticalRouteOfAdministration.transform_json(var) } unless json_hash['routeOfAdministration'].nil?

      result
    end
  end
end
