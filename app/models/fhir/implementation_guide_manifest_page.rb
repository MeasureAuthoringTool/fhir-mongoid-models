module FHIR
  # fhir/implementation_guide_manifest_page.rb
  class ImplementationGuideManifestPage < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_many :anchor, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.title.nil? 
        result['title'] = self.title.value
        serialized = Extension.serializePrimitiveExtension(self.title)            
        result['_title'] = serialized unless serialized.nil?
      end
      unless self.anchor.nil?  || !self.anchor.any? 
        result['anchor'] = self.anchor.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.anchor)                              
        result['_anchor'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ImplementationGuideManifestPage.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['anchor'] = json_hash['anchor'].each_with_index.map do |var, i|
        extension_hash = json_hash['_anchor'] && json_hash['_anchor'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['anchor'].nil?

      result
    end
  end
end
