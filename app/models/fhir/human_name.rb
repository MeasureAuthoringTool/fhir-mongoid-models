module FHIR
  # fhir/human_name.rb
  class HumanName < Element
    include Mongoid::Document
    embeds_one :use, class_name: 'FHIR::NameUse'    
    embeds_one :text, class_name: 'FHIR::PrimitiveString'    
    embeds_one :family, class_name: 'FHIR::PrimitiveString'    
    embeds_many :given, class_name: 'FHIR::PrimitiveString'    
    embeds_many :prefix, class_name: 'FHIR::PrimitiveString'    
    embeds_many :suffix, class_name: 'FHIR::PrimitiveString'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.use.nil? 
        result['use'] = self.use.value
        serialized = Extension.serializePrimitiveExtension(self.use)            
        result['_use'] = serialized unless serialized.nil?
      end
      unless self.text.nil? 
        result['text'] = self.text.value
        serialized = Extension.serializePrimitiveExtension(self.text)            
        result['_text'] = serialized unless serialized.nil?
      end
      unless self.family.nil? 
        result['family'] = self.family.value
        serialized = Extension.serializePrimitiveExtension(self.family)            
        result['_family'] = serialized unless serialized.nil?
      end
      unless self.given.nil?  || !self.given.any? 
        result['given'] = self.given.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.given)                              
        result['_given'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.prefix.nil?  || !self.prefix.any? 
        result['prefix'] = self.prefix.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.prefix)                              
        result['_prefix'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.suffix.nil?  || !self.suffix.any? 
        result['suffix'] = self.suffix.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.suffix)                              
        result['_suffix'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = HumanName.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['use'] = NameUse.transform_json(json_hash['use'], json_hash['_use']) unless json_hash['use'].nil?
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?
      result['family'] = PrimitiveString.transform_json(json_hash['family'], json_hash['_family']) unless json_hash['family'].nil?
      result['given'] = json_hash['given'].each_with_index.map do |var, i|
        extension_hash = json_hash['_given'] && json_hash['_given'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['given'].nil?
      result['prefix'] = json_hash['prefix'].each_with_index.map do |var, i|
        extension_hash = json_hash['_prefix'] && json_hash['_prefix'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['prefix'].nil?
      result['suffix'] = json_hash['suffix'].each_with_index.map do |var, i|
        extension_hash = json_hash['_suffix'] && json_hash['_suffix'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['suffix'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
