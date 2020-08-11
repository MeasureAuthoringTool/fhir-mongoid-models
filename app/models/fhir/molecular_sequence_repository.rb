module FHIR
  # fhir/molecular_sequence_repository.rb
  class MolecularSequenceRepository < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::RepositoryType'    
    embeds_one :url, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :datasetId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :variantsetId, class_name: 'FHIR::PrimitiveString'    
    embeds_one :readsetId, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.url.nil? 
        result['url'] = self.url.value
        serialized = Extension.serializePrimitiveExtension(self.url)            
        result['_url'] = serialized unless serialized.nil?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.datasetId.nil? 
        result['datasetId'] = self.datasetId.value
        serialized = Extension.serializePrimitiveExtension(self.datasetId)            
        result['_datasetId'] = serialized unless serialized.nil?
      end
      unless self.variantsetId.nil? 
        result['variantsetId'] = self.variantsetId.value
        serialized = Extension.serializePrimitiveExtension(self.variantsetId)            
        result['_variantsetId'] = serialized unless serialized.nil?
      end
      unless self.readsetId.nil? 
        result['readsetId'] = self.readsetId.value
        serialized = Extension.serializePrimitiveExtension(self.readsetId)            
        result['_readsetId'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MolecularSequenceRepository.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = RepositoryType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['url'] = PrimitiveUri.transform_json(json_hash['url'], json_hash['_url']) unless json_hash['url'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['datasetId'] = PrimitiveString.transform_json(json_hash['datasetId'], json_hash['_datasetId']) unless json_hash['datasetId'].nil?
      result['variantsetId'] = PrimitiveString.transform_json(json_hash['variantsetId'], json_hash['_variantsetId']) unless json_hash['variantsetId'].nil?
      result['readsetId'] = PrimitiveString.transform_json(json_hash['readsetId'], json_hash['_readsetId']) unless json_hash['readsetId'].nil?

      result
    end
  end
end
