module FHIR
  # fhir/medicinal_product_manufacturing_business_operation.rb
  class MedicinalProductManufacturingBusinessOperation < BackboneElement
    include Mongoid::Document
    embeds_one :operationType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :authorisationReferenceNumber, class_name: 'FHIR::Identifier'    
    embeds_one :effectiveDate, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :confidentialityIndicator, class_name: 'FHIR::CodeableConcept'    
    embeds_many :manufacturer, class_name: 'FHIR::Reference'    
    embeds_one :regulator, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.operationType.nil? 
        result['operationType'] = self.operationType.as_json(*args)
      end
      unless self.authorisationReferenceNumber.nil? 
        result['authorisationReferenceNumber'] = self.authorisationReferenceNumber.as_json(*args)
      end
      unless self.effectiveDate.nil? 
        result['effectiveDate'] = self.effectiveDate.value
        serialized = Extension.serializePrimitiveExtension(self.effectiveDate)            
        result['_effectiveDate'] = serialized unless serialized.nil?
      end
      unless self.confidentialityIndicator.nil? 
        result['confidentialityIndicator'] = self.confidentialityIndicator.as_json(*args)
      end
      unless self.manufacturer.nil?  || !self.manufacturer.any? 
        result['manufacturer'] = self.manufacturer.map{ |x| x.as_json(*args) }
      end
      unless self.regulator.nil? 
        result['regulator'] = self.regulator.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

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
