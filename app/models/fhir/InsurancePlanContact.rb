module FHIR
  class InsurancePlanContact < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'InsurancePlanContact'
    embeds_one :purpose, class_name: 'CodeableConcept'
    embeds_one :name, class_name: 'HumanName'
    embeds_many :telecom, class_name: 'ContactPoint'
    embeds_one :address, class_name: 'Address'
  end
end
