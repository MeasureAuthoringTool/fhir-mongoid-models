module FHIR
  # fhir/medicinal_product_pharmaceutical_characteristics.rb
  class MedicinalProductPharmaceuticalCharacteristics < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPharmaceuticalCharacteristics'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = MedicinalProductPharmaceuticalCharacteristics.new
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?      

      result
    end
  end
end
