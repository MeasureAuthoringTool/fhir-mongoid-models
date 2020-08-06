module FHIR
  # fhir/biologically_derived_product_collection.rb
  class BiologicallyDerivedProductCollection < BackboneElement
    include Mongoid::Document
    embeds_one :collector, class_name: 'FHIR::Reference'    
    embeds_one :source, class_name: 'FHIR::Reference'    
    embeds_one :collectedDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :collectedPeriod, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.collector.nil? 
        result['collector'] = self.collector.as_json(*args)
      end
      unless self.source.nil? 
        result['source'] = self.source.as_json(*args)
      end
      unless self.collectedDateTime.nil?
        result['collectedDateTime'] = self.collectedDateTime.value                        
        serialized = Extension.serializePrimitiveExtension(self.collectedDateTime) 
        result['_collectedDateTime'] = serialized unless serialized.nil?
      end          
      unless self.collectedPeriod.nil?
        result['collectedPeriod'] = self.collectedPeriod.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = BiologicallyDerivedProductCollection.new)
      result = self.superclass.transform_json(json_hash, target)
      result['collector'] = Reference.transform_json(json_hash['collector']) unless json_hash['collector'].nil?
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?
      result['collectedDateTime'] = PrimitiveDateTime.transform_json(json_hash['collectedDateTime'], json_hash['_collectedDateTime']) unless json_hash['collectedDateTime'].nil?
      result['collectedPeriod'] = Period.transform_json(json_hash['collectedPeriod']) unless json_hash['collectedPeriod'].nil?

      result
    end
  end
end
