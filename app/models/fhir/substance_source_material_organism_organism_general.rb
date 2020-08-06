module FHIR
  # fhir/substance_source_material_organism_organism_general.rb
  class SubstanceSourceMaterialOrganismOrganismGeneral < BackboneElement
    include Mongoid::Document
    embeds_one :kingdom, class_name: 'FHIR::CodeableConcept'    
    embeds_one :phylum, class_name: 'FHIR::CodeableConcept'    
    embeds_one :class, class_name: 'FHIR::CodeableConcept'    
    embeds_one :order, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.kingdom.nil? 
        result['kingdom'] = self.kingdom.as_json(*args)
      end
      unless self.phylum.nil? 
        result['phylum'] = self.phylum.as_json(*args)
      end
      unless self.class.nil? 
        result['class'] = self.class.as_json(*args)
      end
      unless self.order.nil? 
        result['order'] = self.order.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceSourceMaterialOrganismOrganismGeneral.new)
      result = self.superclass.transform_json(json_hash, target)
      result['kingdom'] = CodeableConcept.transform_json(json_hash['kingdom']) unless json_hash['kingdom'].nil?
      result['phylum'] = CodeableConcept.transform_json(json_hash['phylum']) unless json_hash['phylum'].nil?
      result['class'] = CodeableConcept.transform_json(json_hash['class']) unless json_hash['class'].nil?
      result['order'] = CodeableConcept.transform_json(json_hash['order']) unless json_hash['order'].nil?

      result
    end
  end
end
