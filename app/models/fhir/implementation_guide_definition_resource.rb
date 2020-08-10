module FHIR
  # fhir/implementation_guide_definition_resource.rb
  class ImplementationGuideDefinitionResource < BackboneElement
    include Mongoid::Document
    embeds_one :reference, class_name: 'FHIR::Reference'    
    embeds_many :fhirVersion, class_name: 'FHIR::FHIRVersion'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :exampleBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :exampleCanonical, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_one :groupingId, class_name: 'FHIR::PrimitiveId'    
    
    def as_json(*args)
      result = super      
      unless self.reference.nil? 
        result['reference'] = self.reference.as_json(*args)
      end
      unless self.fhirVersion.nil?  || !self.fhirVersion.any? 
        result['fhirVersion'] = self.fhirVersion.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.fhirVersion)                              
        result['_fhirVersion'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.exampleBoolean.nil?
        result['exampleBoolean'] = self.exampleBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.exampleBoolean) 
        result['_exampleBoolean'] = serialized unless serialized.nil?
      end          
      unless self.exampleCanonical.nil?
        result['exampleCanonical'] = self.exampleCanonical.value                        
        serialized = Extension.serializePrimitiveExtension(self.exampleCanonical) 
        result['_exampleCanonical'] = serialized unless serialized.nil?
      end          
      unless self.groupingId.nil? 
        result['groupingId'] = self.groupingId.value
        serialized = Extension.serializePrimitiveExtension(self.groupingId)            
        result['_groupingId'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuideDefinitionResource.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['reference'] = Reference.transform_json(json_hash['reference']) unless json_hash['reference'].nil?
      result['fhirVersion'] = json_hash['fhirVersion'].each_with_index.map do |var, i|
        extension_hash = json_hash['_fhirVersion'] && json_hash['_fhirVersion'][i]
        FHIRVersion.transform_json(var, extension_hash)
      end unless json_hash['fhirVersion'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['exampleBoolean'] = PrimitiveBoolean.transform_json(json_hash['exampleBoolean'], json_hash['_exampleBoolean']) unless json_hash['exampleBoolean'].nil?
      result['exampleCanonical'] = PrimitiveCanonical.transform_json(json_hash['exampleCanonical'], json_hash['_exampleCanonical']) unless json_hash['exampleCanonical'].nil?
      result['groupingId'] = PrimitiveId.transform_json(json_hash['groupingId'], json_hash['_groupingId']) unless json_hash['groupingId'].nil?

      result
    end
  end
end
