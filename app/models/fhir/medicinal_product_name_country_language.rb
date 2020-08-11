module FHIR
  # fhir/medicinal_product_name_country_language.rb
  class MedicinalProductNameCountryLanguage < BackboneElement
    include Mongoid::Document
    embeds_one :country, class_name: 'FHIR::CodeableConcept'    
    embeds_one :jurisdiction, class_name: 'FHIR::CodeableConcept'    
    embeds_one :language, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.country.nil? 
        result['country'] = self.country.as_json(*args)
      end
      unless self.jurisdiction.nil? 
        result['jurisdiction'] = self.jurisdiction.as_json(*args)
      end
      unless self.language.nil? 
        result['language'] = self.language.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductNameCountryLanguage.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['country'] = CodeableConcept.transform_json(json_hash['country']) unless json_hash['country'].nil?
      result['jurisdiction'] = CodeableConcept.transform_json(json_hash['jurisdiction']) unless json_hash['jurisdiction'].nil?
      result['language'] = CodeableConcept.transform_json(json_hash['language']) unless json_hash['language'].nil?

      result
    end
  end
end
