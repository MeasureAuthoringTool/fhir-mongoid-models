module FHIR
  # fhir/medicinal_product_special_designation.rb
  class MedicinalProductSpecialDesignation < BackboneElement
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :intendedUse, class_name: 'FHIR::CodeableConcept'
    embeds_one :indicationCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :indicationReference, class_name: 'FHIR::Reference'
    embeds_one :status, class_name: 'FHIR::CodeableConcept'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :species, class_name: 'FHIR::CodeableConcept'

    def self.transform_json(json_hash, target = MedicinalProductSpecialDesignation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['intendedUse'] = CodeableConcept.transform_json(json_hash['intendedUse']) unless json_hash['intendedUse'].nil?      
      result['indicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['indicationCodeableConcept']) unless json_hash['indicationCodeableConcept'].nil?      
      result['indicationReference'] = Reference.transform_json(json_hash['indicationReference']) unless json_hash['indicationReference'].nil?      
      result['status'] = CodeableConcept.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['species'] = CodeableConcept.transform_json(json_hash['species']) unless json_hash['species'].nil?      

      result
    end
  end
end
