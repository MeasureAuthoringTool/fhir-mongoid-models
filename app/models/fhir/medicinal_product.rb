module FHIR
  # fhir/medicinal_product.rb
  class MedicinalProduct < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :domain, class_name: 'FHIR::Coding'
    embeds_one :combinedPharmaceuticalDoseForm, class_name: 'FHIR::CodeableConcept'
    embeds_one :legalStatusOfSupply, class_name: 'FHIR::CodeableConcept'
    embeds_one :additionalMonitoringIndicator, class_name: 'FHIR::CodeableConcept'
    embeds_many :specialMeasures, class_name: 'FHIR::PrimitiveString'
    embeds_one :paediatricUseIndicator, class_name: 'FHIR::CodeableConcept'
    embeds_many :productClassification, class_name: 'FHIR::CodeableConcept'
    embeds_many :marketingStatus, class_name: 'FHIR::MarketingStatus'
    embeds_many :pharmaceuticalProduct, class_name: 'FHIR::Reference'
    embeds_many :packagedMedicinalProduct, class_name: 'FHIR::Reference'
    embeds_many :attachedDocument, class_name: 'FHIR::Reference'
    embeds_many :masterFile, class_name: 'FHIR::Reference'
    embeds_many :contact, class_name: 'FHIR::Reference'
    embeds_many :clinicalTrial, class_name: 'FHIR::Reference'
    embeds_many :name, class_name: 'FHIR::MedicinalProductName'
    embeds_many :crossReference, class_name: 'FHIR::Identifier'
    embeds_many :manufacturingBusinessOperation, class_name: 'FHIR::MedicinalProductManufacturingBusinessOperation'
    embeds_many :specialDesignation, class_name: 'FHIR::MedicinalProductSpecialDesignation'

    def self.transform_json(json_hash, target = MedicinalProduct.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['domain'] = Coding.transform_json(json_hash['domain']) unless json_hash['domain'].nil?      
      result['combinedPharmaceuticalDoseForm'] = CodeableConcept.transform_json(json_hash['combinedPharmaceuticalDoseForm']) unless json_hash['combinedPharmaceuticalDoseForm'].nil?      
      result['legalStatusOfSupply'] = CodeableConcept.transform_json(json_hash['legalStatusOfSupply']) unless json_hash['legalStatusOfSupply'].nil?      
      result['additionalMonitoringIndicator'] = CodeableConcept.transform_json(json_hash['additionalMonitoringIndicator']) unless json_hash['additionalMonitoringIndicator'].nil?      
      result['specialMeasures'] = json_hash['specialMeasures'].each_with_index.map do |var, i|
        extension_hash = json_hash['_specialMeasures'] && json_hash['_specialMeasures'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['specialMeasures'].nil?
      result['paediatricUseIndicator'] = CodeableConcept.transform_json(json_hash['paediatricUseIndicator']) unless json_hash['paediatricUseIndicator'].nil?      
      result['productClassification'] = json_hash['productClassification'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['productClassification'].nil?
      result['marketingStatus'] = json_hash['marketingStatus'].map { |var| MarketingStatus.transform_json(var) } unless json_hash['marketingStatus'].nil?
      result['pharmaceuticalProduct'] = json_hash['pharmaceuticalProduct'].map { |var| Reference.transform_json(var) } unless json_hash['pharmaceuticalProduct'].nil?
      result['packagedMedicinalProduct'] = json_hash['packagedMedicinalProduct'].map { |var| Reference.transform_json(var) } unless json_hash['packagedMedicinalProduct'].nil?
      result['attachedDocument'] = json_hash['attachedDocument'].map { |var| Reference.transform_json(var) } unless json_hash['attachedDocument'].nil?
      result['masterFile'] = json_hash['masterFile'].map { |var| Reference.transform_json(var) } unless json_hash['masterFile'].nil?
      result['contact'] = json_hash['contact'].map { |var| Reference.transform_json(var) } unless json_hash['contact'].nil?
      result['clinicalTrial'] = json_hash['clinicalTrial'].map { |var| Reference.transform_json(var) } unless json_hash['clinicalTrial'].nil?
      result['name'] = json_hash['name'].map { |var| MedicinalProductName.transform_json(var) } unless json_hash['name'].nil?
      result['crossReference'] = json_hash['crossReference'].map { |var| Identifier.transform_json(var) } unless json_hash['crossReference'].nil?
      result['manufacturingBusinessOperation'] = json_hash['manufacturingBusinessOperation'].map { |var| MedicinalProductManufacturingBusinessOperation.transform_json(var) } unless json_hash['manufacturingBusinessOperation'].nil?
      result['specialDesignation'] = json_hash['specialDesignation'].map { |var| MedicinalProductSpecialDesignation.transform_json(var) } unless json_hash['specialDesignation'].nil?

      result
    end
  end
end
