module FHIR
  class MedicinalProductPackaged < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductPackaged'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :subject, class_name: 'Reference'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :legalStatusOfSupply, class_name: 'CodeableConcept'
    embeds_many :marketingStatus, class_name: 'MarketingStatus'
    embeds_one :marketingAuthorization, class_name: 'Reference'
    embeds_many :manufacturer, class_name: 'Reference'
    embeds_many :batchIdentifier, class_name: 'MedicinalProductPackagedBatchIdentifier'
    embeds_many :packageItem, class_name: 'MedicinalProductPackagedPackageItem'
  end
end
