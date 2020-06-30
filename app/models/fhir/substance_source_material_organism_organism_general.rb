module FHIR
  # fhir/substance_source_material_organism_organism_general.rb
  class SubstanceSourceMaterialOrganismOrganismGeneral < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialOrganismOrganismGeneral'
    embeds_one :kingdom, class_name: 'CodeableConcept'
    embeds_one :phylum, class_name: 'CodeableConcept'
    embeds_one :class, class_name: 'CodeableConcept'
    embeds_one :order, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=SubstanceSourceMaterialOrganismOrganismGeneral.new)
      result = self.superclass.transform_json(json_hash, target)
      result['kingdom'] = CodeableConcept.transform_json(json_hash['kingdom']) unless json_hash['kingdom'].nil?      
      result['phylum'] = CodeableConcept.transform_json(json_hash['phylum']) unless json_hash['phylum'].nil?      
      result['class'] = CodeableConcept.transform_json(json_hash['class']) unless json_hash['class'].nil?      
      result['order'] = CodeableConcept.transform_json(json_hash['order']) unless json_hash['order'].nil?      

      result
    end
  end
end
