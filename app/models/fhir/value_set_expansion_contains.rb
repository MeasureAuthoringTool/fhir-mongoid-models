module FHIR
  # fhir/value_set_expansion_contains.rb
  class ValueSetExpansionContains < BackboneElement
    include Mongoid::Document
    embeds_one :system, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :abstract, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :inactive, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :version, class_name: 'FHIR::PrimitiveString'    
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :display, class_name: 'FHIR::PrimitiveString'    
    embeds_many :designation, class_name: 'FHIR::ValueSetComposeIncludeConceptDesignation'    
    embeds_many :contains, class_name: 'FHIR::ValueSetExpansionContains'    
    
    def as_json(*args)
      result = super      
      unless self.system.nil? 
        result['system'] = self.system.value
        serialized = Extension.serializePrimitiveExtension(self.system)            
        result['_system'] = serialized unless serialized.nil?
      end
      unless self.abstract.nil? 
        result['abstract'] = self.abstract.value
        serialized = Extension.serializePrimitiveExtension(self.abstract)            
        result['_abstract'] = serialized unless serialized.nil?
      end
      unless self.inactive.nil? 
        result['inactive'] = self.inactive.value
        serialized = Extension.serializePrimitiveExtension(self.inactive)            
        result['_inactive'] = serialized unless serialized.nil?
      end
      unless self.version.nil? 
        result['version'] = self.version.value
        serialized = Extension.serializePrimitiveExtension(self.version)            
        result['_version'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.value
        serialized = Extension.serializePrimitiveExtension(self.code)            
        result['_code'] = serialized unless serialized.nil?
      end
      unless self.display.nil? 
        result['display'] = self.display.value
        serialized = Extension.serializePrimitiveExtension(self.display)            
        result['_display'] = serialized unless serialized.nil?
      end
      unless self.designation.nil?  || !self.designation.any? 
        result['designation'] = self.designation.map{ |x| x.as_json(*args) }
      end
      unless self.contains.nil?  || !self.contains.any? 
        result['contains'] = self.contains.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ValueSetExpansionContains.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?
      result['abstract'] = PrimitiveBoolean.transform_json(json_hash['abstract'], json_hash['_abstract']) unless json_hash['abstract'].nil?
      result['inactive'] = PrimitiveBoolean.transform_json(json_hash['inactive'], json_hash['_inactive']) unless json_hash['inactive'].nil?
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?
      result['designation'] = json_hash['designation'].map { |var| ValueSetComposeIncludeConceptDesignation.transform_json(var) } unless json_hash['designation'].nil?
      result['contains'] = json_hash['contains'].map { |var| ValueSetExpansionContains.transform_json(var) } unless json_hash['contains'].nil?

      result
    end
  end
end
