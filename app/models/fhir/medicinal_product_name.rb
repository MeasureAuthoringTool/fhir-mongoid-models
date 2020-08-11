module FHIR
  # fhir/medicinal_product_name.rb
  class MedicinalProductName < BackboneElement
    include Mongoid::Document
    embeds_one :productName, class_name: 'FHIR::PrimitiveString'    
    embeds_many :namePart, class_name: 'FHIR::MedicinalProductNameNamePart'    
    embeds_many :countryLanguage, class_name: 'FHIR::MedicinalProductNameCountryLanguage'    
    
    def as_json(*args)
      result = super      
      unless self.productName.nil? 
        result['productName'] = self.productName.value
        serialized = Extension.serializePrimitiveExtension(self.productName)            
        result['_productName'] = serialized unless serialized.nil?
      end
      unless self.namePart.nil?  || !self.namePart.any? 
        result['namePart'] = self.namePart.map{ |x| x.as_json(*args) }
      end
      unless self.countryLanguage.nil?  || !self.countryLanguage.any? 
        result['countryLanguage'] = self.countryLanguage.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductName.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['productName'] = PrimitiveString.transform_json(json_hash['productName'], json_hash['_productName']) unless json_hash['productName'].nil?
      result['namePart'] = json_hash['namePart'].map { |var| MedicinalProductNameNamePart.transform_json(var) } unless json_hash['namePart'].nil?
      result['countryLanguage'] = json_hash['countryLanguage'].map { |var| MedicinalProductNameCountryLanguage.transform_json(var) } unless json_hash['countryLanguage'].nil?

      result
    end
  end
end
