module FHIR
  # fhir/graph_definition_link.rb
  class GraphDefinitionLink < BackboneElement
    include Mongoid::Document
    embeds_one :path, class_name: 'FHIR::PrimitiveString'    
    embeds_one :sliceName, class_name: 'FHIR::PrimitiveString'    
    embeds_one :min, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :max, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_many :target, class_name: 'FHIR::GraphDefinitionLinkTarget'    
    
    def as_json(*args)
      result = super      
      unless self.path.nil? 
        result['path'] = self.path.value
        serialized = Extension.serializePrimitiveExtension(self.path)            
        result['_path'] = serialized unless serialized.nil?
      end
      unless self.sliceName.nil? 
        result['sliceName'] = self.sliceName.value
        serialized = Extension.serializePrimitiveExtension(self.sliceName)            
        result['_sliceName'] = serialized unless serialized.nil?
      end
      unless self.min.nil? 
        result['min'] = self.min.value
        serialized = Extension.serializePrimitiveExtension(self.min)            
        result['_min'] = serialized unless serialized.nil?
      end
      unless self.max.nil? 
        result['max'] = self.max.value
        serialized = Extension.serializePrimitiveExtension(self.max)            
        result['_max'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.target.nil?  || !self.target.any? 
        result['target'] = self.target.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = GraphDefinitionLink.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?
      result['sliceName'] = PrimitiveString.transform_json(json_hash['sliceName'], json_hash['_sliceName']) unless json_hash['sliceName'].nil?
      result['min'] = PrimitiveInteger.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['target'] = json_hash['target'].map { |var| GraphDefinitionLinkTarget.transform_json(var) } unless json_hash['target'].nil?

      result
    end
  end
end
