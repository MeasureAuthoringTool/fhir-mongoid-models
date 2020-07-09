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

    def self.transform_json(json_hash, target = ObservationDefinition.new)
      result = self.superclass.transform_json(json_hash, target)
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['permittedDataType'] = json_hash['permittedDataType'].map { |var| ObservationDataType.transform_json(var) } unless json_hash['permittedDataType'].nil?
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
