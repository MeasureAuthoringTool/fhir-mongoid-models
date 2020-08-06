module FHIR
  # fhir/implementation_guide_manifest.rb
  class ImplementationGuideManifest < BackboneElement
    include Mongoid::Document
    embeds_one :rendering, class_name: 'FHIR::PrimitiveUrl'    
    embeds_many :resource, class_name: 'FHIR::ImplementationGuideManifestResource'    
    embeds_many :page, class_name: 'FHIR::ImplementationGuideManifestPage'    
    embeds_many :image, class_name: 'FHIR::PrimitiveString'    
    embeds_many :other, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.rendering.nil? 
        result['rendering'] = self.rendering.value
        serialized = Extension.serializePrimitiveExtension(self.rendering)            
        result['_rendering'] = serialized unless serialized.nil?
      end
      unless self.resource.nil?  || !self.resource.any? 
        result['resource'] = self.resource.map{ |x| x.as_json(*args) }
      end
      unless self.page.nil?  || !self.page.any? 
        result['page'] = self.page.map{ |x| x.as_json(*args) }
      end
      unless self.image.nil?  || !self.image.any? 
        result['image'] = self.image.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.image)                              
        result['_image'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.other.nil?  || !self.other.any? 
        result['other'] = self.other.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.other)                              
        result['_other'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuideManifest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['rendering'] = PrimitiveUrl.transform_json(json_hash['rendering'], json_hash['_rendering']) unless json_hash['rendering'].nil?
      result['resource'] = json_hash['resource'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ImplementationGuideManifestResource.transform_json(var) 
        end
      } unless json_hash['resource'].nil?
      result['page'] = json_hash['page'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          ImplementationGuideManifestPage.transform_json(var) 
        end
      } unless json_hash['page'].nil?
      result['image'] = json_hash['image'].each_with_index.map do |var, i|
        extension_hash = json_hash['_image'] && json_hash['_image'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['image'].nil?
      result['other'] = json_hash['other'].each_with_index.map do |var, i|
        extension_hash = json_hash['_other'] && json_hash['_other'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['other'].nil?

      result
    end
  end
end
