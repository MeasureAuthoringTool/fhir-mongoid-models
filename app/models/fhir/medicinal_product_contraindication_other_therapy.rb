module FHIR
  # fhir/medicinal_product_contraindication_other_therapy.rb
  class MedicinalProductContraindicationOtherTherapy < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductContraindicationOtherTherapy'
    embeds_one :therapyRelationshipType, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = MedicinalProductContraindicationOtherTherapy.new
      result['therapyRelationshipType'] = CodeableConcept.transform_json(json_hash['therapyRelationshipType']) unless json_hash['therapyRelationshipType'].nil?      
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?      
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?      

      result
    end
  end
end
