module FHIR
  # fhir/substance_source_material_organism.rb
  class SubstanceSourceMaterialOrganism < BackboneElement
    include Mongoid::Document
    embeds_one :family, class_name: 'FHIR::CodeableConcept'    
    embeds_one :genus, class_name: 'FHIR::CodeableConcept'    
    embeds_one :species, class_name: 'FHIR::CodeableConcept'    
    embeds_one :intraspecificType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :intraspecificDescription, class_name: 'FHIR::PrimitiveString'    
    embeds_many :author, class_name: 'FHIR::SubstanceSourceMaterialOrganismAuthor'    
    embeds_one :hybrid, class_name: 'FHIR::SubstanceSourceMaterialOrganismHybrid'    
    embeds_one :organismGeneral, class_name: 'FHIR::SubstanceSourceMaterialOrganismOrganismGeneral'    
    
    def as_json(*args)
      result = super      
      unless self.family.nil? 
        result['family'] = self.family.as_json(*args)
      end
      unless self.genus.nil? 
        result['genus'] = self.genus.as_json(*args)
      end
      unless self.species.nil? 
        result['species'] = self.species.as_json(*args)
      end
      unless self.intraspecificType.nil? 
        result['intraspecificType'] = self.intraspecificType.as_json(*args)
      end
      unless self.intraspecificDescription.nil? 
        result['intraspecificDescription'] = self.intraspecificDescription.value
        serialized = Extension.serializePrimitiveExtension(self.intraspecificDescription)            
        result['_intraspecificDescription'] = serialized unless serialized.nil?
      end
      unless self.author.nil?  || !self.author.any? 
        result['author'] = self.author.map{ |x| x.as_json(*args) }
      end
      unless self.hybrid.nil? 
        result['hybrid'] = self.hybrid.as_json(*args)
      end
      unless self.organismGeneral.nil? 
        result['organismGeneral'] = self.organismGeneral.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSourceMaterialOrganism.new)
      result = self.superclass.transform_json(json_hash, target)
      result['family'] = CodeableConcept.transform_json(json_hash['family']) unless json_hash['family'].nil?
      result['genus'] = CodeableConcept.transform_json(json_hash['genus']) unless json_hash['genus'].nil?
      result['species'] = CodeableConcept.transform_json(json_hash['species']) unless json_hash['species'].nil?
      result['intraspecificType'] = CodeableConcept.transform_json(json_hash['intraspecificType']) unless json_hash['intraspecificType'].nil?
      result['intraspecificDescription'] = PrimitiveString.transform_json(json_hash['intraspecificDescription'], json_hash['_intraspecificDescription']) unless json_hash['intraspecificDescription'].nil?
      result['author'] = json_hash['author'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          SubstanceSourceMaterialOrganismAuthor.transform_json(var) 
        end
      } unless json_hash['author'].nil?
      result['hybrid'] = SubstanceSourceMaterialOrganismHybrid.transform_json(json_hash['hybrid']) unless json_hash['hybrid'].nil?
      result['organismGeneral'] = SubstanceSourceMaterialOrganismOrganismGeneral.transform_json(json_hash['organismGeneral']) unless json_hash['organismGeneral'].nil?

      result
    end
  end
end
