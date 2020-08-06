module FHIR
  # fhir/medicinal_product_packaged_batch_identifier.rb
  class MedicinalProductPackagedBatchIdentifier < BackboneElement
    include Mongoid::Document
    embeds_one :outerPackaging, class_name: 'FHIR::Identifier'    
    embeds_one :immediatePackaging, class_name: 'FHIR::Identifier'    
    
    def as_json(*args)
      result = super      
      unless self.outerPackaging.nil? 
        result['outerPackaging'] = self.outerPackaging.as_json(*args)
      end
      unless self.immediatePackaging.nil? 
        result['immediatePackaging'] = self.immediatePackaging.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductPackagedBatchIdentifier.new)
      result = self.superclass.transform_json(json_hash, target)
      result['outerPackaging'] = Identifier.transform_json(json_hash['outerPackaging']) unless json_hash['outerPackaging'].nil?
      result['immediatePackaging'] = Identifier.transform_json(json_hash['immediatePackaging']) unless json_hash['immediatePackaging'].nil?

      result
    end
  end
end
