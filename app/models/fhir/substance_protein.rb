module FHIR
  # fhir/substance_protein.rb
  class SubstanceProtein < DomainResource
    include Mongoid::Document
    embeds_one :sequenceType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :numberOfSubunits, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :disulfideLinkage, class_name: 'FHIR::PrimitiveString'    
    embeds_many :subunit, class_name: 'FHIR::SubstanceProteinSubunit'    
    
    def as_json(*args)
      result = super      
      unless self.sequenceType.nil? 
        result['sequenceType'] = self.sequenceType.as_json(*args)
      end
      unless self.numberOfSubunits.nil? 
        result['numberOfSubunits'] = self.numberOfSubunits.value
        serialized = Extension.serializePrimitiveExtension(self.numberOfSubunits)            
        result['_numberOfSubunits'] = serialized unless serialized.nil?
      end
      unless self.disulfideLinkage.nil?  || !self.disulfideLinkage.any? 
        result['disulfideLinkage'] = self.disulfideLinkage.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.disulfideLinkage)                              
        result['_disulfideLinkage'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.subunit.nil?  || !self.subunit.any? 
        result['subunit'] = self.subunit.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceProtein.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequenceType'] = CodeableConcept.transform_json(json_hash['sequenceType']) unless json_hash['sequenceType'].nil?
      result['numberOfSubunits'] = PrimitiveInteger.transform_json(json_hash['numberOfSubunits'], json_hash['_numberOfSubunits']) unless json_hash['numberOfSubunits'].nil?
      result['disulfideLinkage'] = json_hash['disulfideLinkage'].each_with_index.map do |var, i|
        extension_hash = json_hash['_disulfideLinkage'] && json_hash['_disulfideLinkage'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['disulfideLinkage'].nil?
      result['subunit'] = json_hash['subunit'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceProteinSubunit.transform_json(var) 
        end
      } unless json_hash['subunit'].nil?

      result
    end
  end
end
