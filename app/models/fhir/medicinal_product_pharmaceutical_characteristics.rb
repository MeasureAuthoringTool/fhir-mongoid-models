module FHIR
  # fhir/medicinal_product_pharmaceutical_characteristics.rb
  class MedicinalProductPharmaceuticalCharacteristics < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::CodeableConcept'    

    def self.transform_json(json_hash, target = MedicinalProductPharmaceuticalCharacteristics.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?

      result
    end
  end
end
