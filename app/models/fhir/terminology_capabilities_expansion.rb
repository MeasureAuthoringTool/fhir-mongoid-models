module FHIR
  # fhir/terminology_capabilities_expansion.rb
  class TerminologyCapabilitiesExpansion < BackboneElement
    include Mongoid::Document
    embeds_one :hierarchical, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :paging, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :incomplete, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_many :parameter, class_name: 'FHIR::TerminologyCapabilitiesExpansionParameter'    
    embeds_one :textFilter, class_name: 'FHIR::PrimitiveMarkdown'    
    
    def as_json(*args)
      result = super      
      unless self.hierarchical.nil? 
        result['hierarchical'] = self.hierarchical.value
        serialized = Extension.serializePrimitiveExtension(self.hierarchical)            
        result['_hierarchical'] = serialized unless serialized.nil?
      end
      unless self.paging.nil? 
        result['paging'] = self.paging.value
        serialized = Extension.serializePrimitiveExtension(self.paging)            
        result['_paging'] = serialized unless serialized.nil?
      end
      unless self.incomplete.nil? 
        result['incomplete'] = self.incomplete.value
        serialized = Extension.serializePrimitiveExtension(self.incomplete)            
        result['_incomplete'] = serialized unless serialized.nil?
      end
      unless self.parameter.nil?  || !self.parameter.any? 
        result['parameter'] = self.parameter.map{ |x| x.as_json(*args) }
      end
      unless self.textFilter.nil? 
        result['textFilter'] = self.textFilter.value
        serialized = Extension.serializePrimitiveExtension(self.textFilter)            
        result['_textFilter'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TerminologyCapabilitiesExpansion.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['hierarchical'] = PrimitiveBoolean.transform_json(json_hash['hierarchical'], json_hash['_hierarchical']) unless json_hash['hierarchical'].nil?
      result['paging'] = PrimitiveBoolean.transform_json(json_hash['paging'], json_hash['_paging']) unless json_hash['paging'].nil?
      result['incomplete'] = PrimitiveBoolean.transform_json(json_hash['incomplete'], json_hash['_incomplete']) unless json_hash['incomplete'].nil?
      result['parameter'] = json_hash['parameter'].map { |var| TerminologyCapabilitiesExpansionParameter.transform_json(var) } unless json_hash['parameter'].nil?
      result['textFilter'] = PrimitiveMarkdown.transform_json(json_hash['textFilter'], json_hash['_textFilter']) unless json_hash['textFilter'].nil?

      result
    end
  end
end
