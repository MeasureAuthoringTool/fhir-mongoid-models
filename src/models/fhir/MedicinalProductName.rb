module FHIR
  class MedicinalProductName < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductName'
    field :productName, type:  # primitive
    embeds_one :_productName, class_name: 'Extension'
    embeds_many :namePart, class_name: 'MedicinalProductNameNamePart'
    embeds_many :countryLanguage, class_name: 'MedicinalProductNameCountryLanguage'
  end
end
