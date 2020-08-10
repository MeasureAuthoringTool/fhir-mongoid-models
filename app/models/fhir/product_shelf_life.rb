module FHIR
  # fhir/product_shelf_life.rb
  class ProductShelfLife < BackboneElement
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :period, class_name: 'FHIR::Quantity'    
    embeds_many :specialPrecautionsForStorage, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.specialPrecautionsForStorage.nil?  || !self.specialPrecautionsForStorage.any? 
        result['specialPrecautionsForStorage'] = self.specialPrecautionsForStorage.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ProductShelfLife.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['period'] = Quantity.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['specialPrecautionsForStorage'] = json_hash['specialPrecautionsForStorage'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['specialPrecautionsForStorage'].nil?

      result
    end
  end
end
