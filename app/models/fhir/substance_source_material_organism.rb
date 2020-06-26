module FHIR
  # fhir/substance_source_material_organism.rb
  class SubstanceSourceMaterialOrganism < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialOrganism'
    embeds_one :family, class_name: 'CodeableConcept'
    embeds_one :genus, class_name: 'CodeableConcept'
    embeds_one :species, class_name: 'CodeableConcept'
    embeds_one :intraspecificType, class_name: 'CodeableConcept'
    embeds_one :intraspecificDescription, class_name: 'PrimitiveString'
    embeds_many :author, class_name: 'SubstanceSourceMaterialOrganismAuthor'
    embeds_one :hybrid, class_name: 'SubstanceSourceMaterialOrganismHybrid'
    embeds_one :organismGeneral, class_name: 'SubstanceSourceMaterialOrganismOrganismGeneral'

    def self.transform_json(json_hash)
      result = SubstanceSourceMaterialOrganism.new
      result['family'] = CodeableConcept.transform_json(json_hash['family']) unless json_hash['family'].nil?      
      result['genus'] = CodeableConcept.transform_json(json_hash['genus']) unless json_hash['genus'].nil?      
      result['species'] = CodeableConcept.transform_json(json_hash['species']) unless json_hash['species'].nil?      
      result['intraspecificType'] = CodeableConcept.transform_json(json_hash['intraspecificType']) unless json_hash['intraspecificType'].nil?      
      result['intraspecificDescription'] = PrimitiveString.transform_json(json_hash['intraspecificDescription'], json_hash['_intraspecificDescription']) unless json_hash['intraspecificDescription'].nil?      
      result['author'] = json_hash['author'].map { |var| SubstanceSourceMaterialOrganismAuthor.transform_json(var) } unless json_hash['author'].nil?
      result['hybrid'] = SubstanceSourceMaterialOrganismHybrid.transform_json(json_hash['hybrid']) unless json_hash['hybrid'].nil?      
      result['organismGeneral'] = SubstanceSourceMaterialOrganismOrganismGeneral.transform_json(json_hash['organismGeneral']) unless json_hash['organismGeneral'].nil?      

      result
    end
  end
end
