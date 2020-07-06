module FHIR
  # fhir/medicinal_product_name.rb
  class MedicinalProductName < BackboneElement
    include Mongoid::Document
    embeds_one :productName, class_name: 'PrimitiveString'
    embeds_many :namePart, class_name: 'MedicinalProductNameNamePart'
    embeds_many :countryLanguage, class_name: 'MedicinalProductNameCountryLanguage'

    def self.transform_json(json_hash, target = MedicinalProductName.new)
      result = self.superclass.transform_json(json_hash, target)
      result['productName'] = PrimitiveString.transform_json(json_hash['productName'], json_hash['_productName']) unless json_hash['productName'].nil?      
      result['namePart'] = json_hash['namePart'].map { |var| MedicinalProductNameNamePart.transform_json(var) } unless json_hash['namePart'].nil?
      result['countryLanguage'] = json_hash['countryLanguage'].map { |var| MedicinalProductNameCountryLanguage.transform_json(var) } unless json_hash['countryLanguage'].nil?

      result
    end
  end
end
