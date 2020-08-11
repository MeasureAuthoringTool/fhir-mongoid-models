module FHIR
  # fhir/meta.rb
  class Meta < Element
    include Mongoid::Document
    embeds_one :versionId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :lastUpdated, class_name: 'FHIR::PrimitiveInstant'    
    embeds_one :source, class_name: 'FHIR::PrimitiveUri'    
    embeds_many :profile, class_name: 'FHIR::PrimitiveCanonical'    
    embeds_many :security, class_name: 'FHIR::Coding'    
    embeds_many :tag, class_name: 'FHIR::Coding'    
    
    def as_json(*args)
      result = super      
      unless self.versionId.nil? 
        result['versionId'] = self.versionId.value
        serialized = Extension.serializePrimitiveExtension(self.versionId)            
        result['_versionId'] = serialized unless serialized.nil?
      end
      unless self.lastUpdated.nil? 
        result['lastUpdated'] = self.lastUpdated.value
        serialized = Extension.serializePrimitiveExtension(self.lastUpdated)            
        result['_lastUpdated'] = serialized unless serialized.nil?
      end
      unless self.source.nil? 
        result['source'] = self.source.value
        serialized = Extension.serializePrimitiveExtension(self.source)            
        result['_source'] = serialized unless serialized.nil?
      end
      unless self.profile.nil?  || !self.profile.any? 
        result['profile'] = self.profile.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.profile)                              
        result['_profile'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.security.nil?  || !self.security.any? 
        result['security'] = self.security.map{ |x| x.as_json(*args) }
      end
      unless self.tag.nil?  || !self.tag.any? 
        result['tag'] = self.tag.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Meta.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['versionId'] = PrimitiveId.transform_json(json_hash['versionId'], json_hash['_versionId']) unless json_hash['versionId'].nil?
      result['lastUpdated'] = PrimitiveInstant.transform_json(json_hash['lastUpdated'], json_hash['_lastUpdated']) unless json_hash['lastUpdated'].nil?
      result['source'] = PrimitiveUri.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?
      result['profile'] = json_hash['profile'].each_with_index.map do |var, i|
        extension_hash = json_hash['_profile'] && json_hash['_profile'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['profile'].nil?
      result['security'] = json_hash['security'].map { |var| Coding.transform_json(var) } unless json_hash['security'].nil?
      result['tag'] = json_hash['tag'].map { |var| Coding.transform_json(var) } unless json_hash['tag'].nil?

      result
    end
  end
end
