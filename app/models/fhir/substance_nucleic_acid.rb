module FHIR
  # fhir/substance_nucleic_acid.rb
  class SubstanceNucleicAcid < DomainResource
    include Mongoid::Document
    embeds_one :sequenceType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :numberOfSubunits, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :areaOfHybridisation, class_name: 'FHIR::PrimitiveString'    
    embeds_one :oligoNucleotideType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :subunit, class_name: 'FHIR::SubstanceNucleicAcidSubunit'    
    
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
      unless self.areaOfHybridisation.nil? 
        result['areaOfHybridisation'] = self.areaOfHybridisation.value
        serialized = Extension.serializePrimitiveExtension(self.areaOfHybridisation)            
        result['_areaOfHybridisation'] = serialized unless serialized.nil?
      end
      unless self.oligoNucleotideType.nil? 
        result['oligoNucleotideType'] = self.oligoNucleotideType.as_json(*args)
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

    def self.transform_json(json_hash, target = SubstanceNucleicAcid.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['sequenceType'] = CodeableConcept.transform_json(json_hash['sequenceType']) unless json_hash['sequenceType'].nil?
      result['numberOfSubunits'] = PrimitiveInteger.transform_json(json_hash['numberOfSubunits'], json_hash['_numberOfSubunits']) unless json_hash['numberOfSubunits'].nil?
      result['areaOfHybridisation'] = PrimitiveString.transform_json(json_hash['areaOfHybridisation'], json_hash['_areaOfHybridisation']) unless json_hash['areaOfHybridisation'].nil?
      result['oligoNucleotideType'] = CodeableConcept.transform_json(json_hash['oligoNucleotideType']) unless json_hash['oligoNucleotideType'].nil?
      result['subunit'] = json_hash['subunit'].map { |var| SubstanceNucleicAcidSubunit.transform_json(var) } unless json_hash['subunit'].nil?

      result
    end
  end
end
