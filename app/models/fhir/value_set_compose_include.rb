module FHIR
  # fhir/value_set_compose_include.rb
  class ValueSetComposeInclude < BackboneElement
    include Mongoid::Document
    embeds_one :system, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_many :concept, class_name: 'FHIR::ValueSetComposeIncludeConcept'    
    embeds_many :filter, class_name: 'FHIR::ValueSetComposeIncludeFilter'    
    embeds_many :valueSet, class_name: 'FHIR::PrimitiveCanonical'    
    
    def as_json(*args)
      result = super      
      unless self.system.nil? 
        result['system'] = self.system.value
        serialized = Extension.serializePrimitiveExtension(self.system)            
        result['_system'] = serialized unless serialized.nil?
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      unless self.concept.nil?  || !self.concept.any? 
        result['concept'] = self.concept.map{ |x| x.as_json(*args) }
      end
      unless self.filter.nil?  || !self.filter.any? 
        result['filter'] = self.filter.map{ |x| x.as_json(*args) }
      end
      unless self.valueSet.nil?  || !self.valueSet.any? 
        result['valueSet'] = self.valueSet.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.valueSet)                              
        result['_valueSet'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ValueSetComposeInclude.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['concept'] = json_hash['concept'].map { |var| ValueSetComposeIncludeConcept.transform_json(var) } unless json_hash['concept'].nil?
      result['filter'] = json_hash['filter'].map { |var| ValueSetComposeIncludeFilter.transform_json(var) } unless json_hash['filter'].nil?
      result['valueSet'] = json_hash['valueSet'].each_with_index.map do |var, i|
        extension_hash = json_hash['_valueSet'] && json_hash['_valueSet'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['valueSet'].nil?

      result
    end
  end
end
