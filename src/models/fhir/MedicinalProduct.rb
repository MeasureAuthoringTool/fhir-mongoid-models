module FHIR
  class MedicinalProduct < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProduct'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :domain, class_name: 'Coding'
    embeds_one :combinedPharmaceuticalDoseForm, class_name: 'CodeableConcept'
    embeds_one :legalStatusOfSupply, class_name: 'CodeableConcept'
    embeds_one :additionalMonitoringIndicator, class_name: 'CodeableConcept'
    field :specialMeasures, type: Array # primitive
    embeds_many :_specialMeasures, class_name: 'Extension'
    embeds_one :paediatricUseIndicator, class_name: 'CodeableConcept'
    embeds_many :productClassification, class_name: 'CodeableConcept'
    embeds_many :marketingStatus, class_name: 'MarketingStatus'
    embeds_many :pharmaceuticalProduct, class_name: 'Reference'
    embeds_many :packagedMedicinalProduct, class_name: 'Reference'
    embeds_many :attachedDocument, class_name: 'Reference'
    embeds_many :masterFile, class_name: 'Reference'
    embeds_many :contact, class_name: 'Reference'
    embeds_many :clinicalTrial, class_name: 'Reference'
    embeds_many :name, class_name: 'MedicinalProductName'
    embeds_many :crossReference, class_name: 'Identifier'
    embeds_many :manufacturingBusinessOperation, class_name: 'MedicinalProductManufacturingBusinessOperation'
    embeds_many :specialDesignation, class_name: 'MedicinalProductSpecialDesignation'
  end
end
