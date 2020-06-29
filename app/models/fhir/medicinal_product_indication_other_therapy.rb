module FHIR
  # fhir/medicinal_product_indication_other_therapy.rb
  class MedicinalProductIndicationOtherTherapy < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductIndicationOtherTherapy'
    embeds_one :therapyRelationshipType, class_name: 'CodeableConcept'
    embeds_one :medicationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :medicationReference, class_name: 'Reference'

    def self.transform_json(json_hash, target=MedicinalProductIndicationOtherTherapy.new)
      result = self.superclass.transform_json(json_hash, target)
      result['therapyRelationshipType'] = CodeableConcept.transform_json(json_hash['therapyRelationshipType']) unless json_hash['therapyRelationshipType'].nil?      
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?      
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?      

      result
    end
  end
end
