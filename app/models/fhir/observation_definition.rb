module FHIR
  # fhir/observation_definition.rb
  class ObservationDefinition < DomainResource
    include Mongoid::Document
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :permittedDataType, class_name: 'FHIR::ObservationDataType'    
    embeds_one :multipleResultsAllowed, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    embeds_one :preferredReportName, class_name: 'FHIR::PrimitiveString'    
    embeds_one :quantitativeDetails, class_name: 'FHIR::ObservationDefinitionQuantitativeDetails'    
    embeds_many :qualifiedInterval, class_name: 'FHIR::ObservationDefinitionQualifiedInterval'    
    embeds_one :validCodedValueSet, class_name: 'FHIR::Reference'    
    embeds_one :normalCodedValueSet, class_name: 'FHIR::Reference'    
    embeds_one :abnormalCodedValueSet, class_name: 'FHIR::Reference'    
    embeds_one :criticalCodedValueSet, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.category.nil?  || !self.category.any? 
        result['category'] = self.category.map{ |x| x.as_json(*args) }
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.permittedDataType.nil?  || !self.permittedDataType.any? 
        result['permittedDataType'] = self.permittedDataType.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.permittedDataType)                              
        result['_permittedDataType'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.multipleResultsAllowed.nil? 
        result['multipleResultsAllowed'] = self.multipleResultsAllowed.value
        serialized = Extension.serializePrimitiveExtension(self.multipleResultsAllowed)            
        result['_multipleResultsAllowed'] = serialized unless serialized.nil?
      end
      unless self.method.nil? 
        result['method'] = self.method.as_json(*args)
      end
      unless self.preferredReportName.nil? 
        result['preferredReportName'] = self.preferredReportName.value
        serialized = Extension.serializePrimitiveExtension(self.preferredReportName)            
        result['_preferredReportName'] = serialized unless serialized.nil?
      end
      unless self.quantitativeDetails.nil? 
        result['quantitativeDetails'] = self.quantitativeDetails.as_json(*args)
      end
      unless self.qualifiedInterval.nil?  || !self.qualifiedInterval.any? 
        result['qualifiedInterval'] = self.qualifiedInterval.map{ |x| x.as_json(*args) }
      end
      unless self.validCodedValueSet.nil? 
        result['validCodedValueSet'] = self.validCodedValueSet.as_json(*args)
      end
      unless self.normalCodedValueSet.nil? 
        result['normalCodedValueSet'] = self.normalCodedValueSet.as_json(*args)
      end
      unless self.abnormalCodedValueSet.nil? 
        result['abnormalCodedValueSet'] = self.abnormalCodedValueSet.as_json(*args)
      end
      unless self.criticalCodedValueSet.nil? 
        result['criticalCodedValueSet'] = self.criticalCodedValueSet.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ObservationDefinition.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['permittedDataType'] = json_hash['permittedDataType'].each_with_index.map do |var, i|
        extension_hash = json_hash['_permittedDataType'] && json_hash['_permittedDataType'][i]
        ObservationDataType.transform_json(var, extension_hash)
      end unless json_hash['permittedDataType'].nil?
      result['multipleResultsAllowed'] = PrimitiveBoolean.transform_json(json_hash['multipleResultsAllowed'], json_hash['_multipleResultsAllowed']) unless json_hash['multipleResultsAllowed'].nil?
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?
      result['preferredReportName'] = PrimitiveString.transform_json(json_hash['preferredReportName'], json_hash['_preferredReportName']) unless json_hash['preferredReportName'].nil?
      result['quantitativeDetails'] = ObservationDefinitionQuantitativeDetails.transform_json(json_hash['quantitativeDetails']) unless json_hash['quantitativeDetails'].nil?
      result['qualifiedInterval'] = json_hash['qualifiedInterval'].map { |var| ObservationDefinitionQualifiedInterval.transform_json(var) } unless json_hash['qualifiedInterval'].nil?
      result['validCodedValueSet'] = Reference.transform_json(json_hash['validCodedValueSet']) unless json_hash['validCodedValueSet'].nil?
      result['normalCodedValueSet'] = Reference.transform_json(json_hash['normalCodedValueSet']) unless json_hash['normalCodedValueSet'].nil?
      result['abnormalCodedValueSet'] = Reference.transform_json(json_hash['abnormalCodedValueSet']) unless json_hash['abnormalCodedValueSet'].nil?
      result['criticalCodedValueSet'] = Reference.transform_json(json_hash['criticalCodedValueSet']) unless json_hash['criticalCodedValueSet'].nil?

      result
    end
  end
end
