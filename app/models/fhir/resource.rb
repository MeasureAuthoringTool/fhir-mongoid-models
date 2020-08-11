module FHIR
  # fhir/resource.rb
  class Resource
    include Mongoid::Document
    field :id, type: String    
    embeds_one :meta, class_name: 'FHIR::Meta'    
    embeds_one :implicitRules, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :language, class_name: 'FHIR::PrimitiveCode'    
    field :resourceType, type: String    
    field :fhirId, type: String    
    
    def as_json(*args)
      result = Hash.new      
      unless self.id.nil? 
        result['id'] = self.id
      end
      unless self.meta.nil? 
        result['meta'] = self.meta.as_json(*args)
      end
      unless self.implicitRules.nil? 
        result['implicitRules'] = self.implicitRules.value
        serialized = Extension.serializePrimitiveExtension(self.implicitRules)            
        result['_implicitRules'] = serialized unless serialized.nil?
      end
      unless self.language.nil? 
        result['language'] = self.language.value
        serialized = Extension.serializePrimitiveExtension(self.language)            
        result['_language'] = serialized unless serialized.nil?
      end
      unless self.resourceType.nil? 
        result['resourceType'] = self.resourceType
      end
      unless self.fhirId.nil? 
        result['fhirId'] = self.fhirId
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Resource.new)
      if 'Resource' == target.class.name.split('::').last && 'Resource' != json_hash['resourceType']
        return Object.const_get('FHIR::' + json_hash['resourceType']).transform_json(json_hash)
      end
    
      result = target
      result['fhirId'] = json_hash['id'] unless json_hash['id'].nil?
      result['meta'] = Meta.transform_json(json_hash['meta']) unless json_hash['meta'].nil?
      result['implicitRules'] = PrimitiveUri.transform_json(json_hash['implicitRules'], json_hash['_implicitRules']) unless json_hash['implicitRules'].nil?
      result['language'] = PrimitiveCode.transform_json(json_hash['language'], json_hash['_language']) unless json_hash['language'].nil?
      result['resourceType'] = json_hash['resourceType'] unless json_hash['resourceType'].nil?

      result
    end
  end
end
