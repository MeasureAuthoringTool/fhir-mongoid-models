module FHIR
  # fhir/substance_polymer.rb
  class SubstancePolymer < DomainResource
    include Mongoid::Document
    embeds_one :class_local, class_name: 'FHIR::CodeableConcept'    
    embeds_one :geometry, class_name: 'FHIR::CodeableConcept'    
    embeds_many :copolymerConnectivity, class_name: 'FHIR::CodeableConcept'    
    embeds_many :modification, class_name: 'FHIR::PrimitiveString'    
    embeds_many :monomerSet, class_name: 'FHIR::SubstancePolymerMonomerSet'    
    embeds_many :repeat, class_name: 'FHIR::SubstancePolymerRepeat'    
    
    def as_json(*args)
      result = super      
      unless self.class_local.nil? 
        result['class'] = self.class_local.as_json(*args)
      end
      unless self.geometry.nil? 
        result['geometry'] = self.geometry.as_json(*args)
      end
      unless self.copolymerConnectivity.nil?  || !self.copolymerConnectivity.any? 
        result['copolymerConnectivity'] = self.copolymerConnectivity.map{ |x| x.as_json(*args) }
      end
      unless self.modification.nil?  || !self.modification.any? 
        result['modification'] = self.modification.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.modification)                              
        result['_modification'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.monomerSet.nil?  || !self.monomerSet.any? 
        result['monomerSet'] = self.monomerSet.map{ |x| x.as_json(*args) }
      end
      unless self.repeat.nil?  || !self.repeat.any? 
        result['repeat'] = self.repeat.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstancePolymer.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['class_local'] = CodeableConcept.transform_json(json_hash['class']) unless json_hash['class'].nil?
      result['geometry'] = CodeableConcept.transform_json(json_hash['geometry']) unless json_hash['geometry'].nil?
      result['copolymerConnectivity'] = json_hash['copolymerConnectivity'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['copolymerConnectivity'].nil?
      result['modification'] = json_hash['modification'].each_with_index.map do |var, i|
        extension_hash = json_hash['_modification'] && json_hash['_modification'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['modification'].nil?
      result['monomerSet'] = json_hash['monomerSet'].map { |var| SubstancePolymerMonomerSet.transform_json(var) } unless json_hash['monomerSet'].nil?
      result['repeat'] = json_hash['repeat'].map { |var| SubstancePolymerRepeat.transform_json(var) } unless json_hash['repeat'].nil?

      result
    end
  end
end
