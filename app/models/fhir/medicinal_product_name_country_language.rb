module FHIR
  # fhir/medicinal_product_name_country_language.rb
  class MedicinalProductNameCountryLanguage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicinalProductNameCountryLanguage'
    embeds_one :country, class_name: 'CodeableConcept'
    embeds_one :jurisdiction, class_name: 'CodeableConcept'
    embeds_one :language, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=MedicinalProductNameCountryLanguage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['country'] = CodeableConcept.transform_json(json_hash['country']) unless json_hash['country'].nil?      
      result['jurisdiction'] = CodeableConcept.transform_json(json_hash['jurisdiction']) unless json_hash['jurisdiction'].nil?      
      result['language'] = CodeableConcept.transform_json(json_hash['language']) unless json_hash['language'].nil?      

      result
    end
  end
end
