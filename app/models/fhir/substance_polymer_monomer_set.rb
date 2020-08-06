module FHIR
  # fhir/substance_polymer_monomer_set.rb
  class SubstancePolymerMonomerSet < BackboneElement
    include Mongoid::Document
    embeds_one :ratioType, class_name: 'FHIR::CodeableConcept'    
    embeds_many :startingMaterial, class_name: 'FHIR::SubstancePolymerMonomerSetStartingMaterial'    
    
    def as_json(*args)
      result = super      
      unless self.ratioType.nil? 
        result['ratioType'] = self.ratioType.as_json(*args)
      end
      unless self.startingMaterial.nil?  || !self.startingMaterial.any? 
        result['startingMaterial'] = self.startingMaterial.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstancePolymerMonomerSet.new)
      result = self.superclass.transform_json(json_hash, target)
      result['ratioType'] = CodeableConcept.transform_json(json_hash['ratioType']) unless json_hash['ratioType'].nil?
      result['startingMaterial'] = json_hash['startingMaterial'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstancePolymerMonomerSetStartingMaterial.transform_json(var) 
        end
      } unless json_hash['startingMaterial'].nil?

      result
    end
  end
end
