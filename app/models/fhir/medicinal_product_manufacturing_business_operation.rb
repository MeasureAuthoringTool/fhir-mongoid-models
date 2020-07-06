module FHIR
  # fhir/medicinal_product_manufacturing_business_operation.rb
  class MedicinalProductManufacturingBusinessOperation < BackboneElement
    include Mongoid::Document
    embeds_one :operationType, class_name: 'CodeableConcept'
    embeds_one :authorisationReferenceNumber, class_name: 'Identifier'
    embeds_one :effectiveDate, class_name: 'PrimitiveDateTime'
    embeds_one :confidentialityIndicator, class_name: 'CodeableConcept'
    embeds_many :manufacturer, class_name: 'Reference'
    embeds_one :regulator, class_name: 'Reference'

    def self.transform_json(json_hash, target = MedicinalProductManufacturingBusinessOperation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['operationType'] = CodeableConcept.transform_json(json_hash['operationType']) unless json_hash['operationType'].nil?      
      result['authorisationReferenceNumber'] = Identifier.transform_json(json_hash['authorisationReferenceNumber']) unless json_hash['authorisationReferenceNumber'].nil?      
      result['effectiveDate'] = PrimitiveDateTime.transform_json(json_hash['effectiveDate'], json_hash['_effectiveDate']) unless json_hash['effectiveDate'].nil?      
      result['confidentialityIndicator'] = CodeableConcept.transform_json(json_hash['confidentialityIndicator']) unless json_hash['confidentialityIndicator'].nil?      
      result['manufacturer'] = json_hash['manufacturer'].map { |var| Reference.transform_json(var) } unless json_hash['manufacturer'].nil?
      result['regulator'] = Reference.transform_json(json_hash['regulator']) unless json_hash['regulator'].nil?      

      result
    end
  end
end
