module FHIR
  # fhir/concept_map_group.rb
  class ConceptMapGroup < BackboneElement
    include Mongoid::Document
    embeds_one :source, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :sourceVersion, class_name: 'FHIR::PrimitiveString'    
    embeds_one :target, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :targetVersion, class_name: 'FHIR::PrimitiveString'    
    embeds_many :element, class_name: 'FHIR::ConceptMapGroupElement'    
    embeds_one :unmapped, class_name: 'FHIR::ConceptMapGroupUnmapped'    
    
    def as_json(*args)
      result = super      
      unless self.source.nil? 
        result['source'] = self.source.value
        serialized = Extension.serializePrimitiveExtension(self.source)            
        result['_source'] = serialized unless serialized.nil?
      end
      unless self.sourceVersion.nil? 
        result['sourceVersion'] = self.sourceVersion.value
        serialized = Extension.serializePrimitiveExtension(self.sourceVersion)            
        result['_sourceVersion'] = serialized unless serialized.nil?
      end
      unless self.target.nil? 
        result['target'] = self.target.value
        serialized = Extension.serializePrimitiveExtension(self.target)            
        result['_target'] = serialized unless serialized.nil?
      end
      unless self.targetVersion.nil? 
        result['targetVersion'] = self.targetVersion.value
        serialized = Extension.serializePrimitiveExtension(self.targetVersion)            
        result['_targetVersion'] = serialized unless serialized.nil?
      end
      unless self.element.nil?  || !self.element.any? 
        result['element'] = self.element.map{ |x| x.as_json(*args) }
      end
      unless self.unmapped.nil? 
        result['unmapped'] = self.unmapped.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ConceptMapGroup.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['source'] = PrimitiveUri.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?
      result['sourceVersion'] = PrimitiveString.transform_json(json_hash['sourceVersion'], json_hash['_sourceVersion']) unless json_hash['sourceVersion'].nil?
      result['target'] = PrimitiveUri.transform_json(json_hash['target'], json_hash['_target']) unless json_hash['target'].nil?
      result['targetVersion'] = PrimitiveString.transform_json(json_hash['targetVersion'], json_hash['_targetVersion']) unless json_hash['targetVersion'].nil?
      result['element'] = json_hash['element'].map { |var| ConceptMapGroupElement.transform_json(var) } unless json_hash['element'].nil?
      result['unmapped'] = ConceptMapGroupUnmapped.transform_json(json_hash['unmapped']) unless json_hash['unmapped'].nil?

      result
    end
  end
end
