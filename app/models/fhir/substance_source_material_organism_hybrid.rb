module FHIR
  # fhir/substance_source_material_organism_hybrid.rb
  class SubstanceSourceMaterialOrganismHybrid < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialOrganismHybrid'
    embeds_one :maternalOrganismId, class_name: 'PrimitiveString'
    embeds_one :maternalOrganismName, class_name: 'PrimitiveString'
    embeds_one :paternalOrganismId, class_name: 'PrimitiveString'
    embeds_one :paternalOrganismName, class_name: 'PrimitiveString'
    embeds_one :hybridType, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = SubstanceSourceMaterialOrganismHybrid.new
      result['maternalOrganismId'] = PrimitiveString.transform_json(json_hash['maternalOrganismId'], json_hash['_maternalOrganismId']) unless json_hash['maternalOrganismId'].nil?      
      result['maternalOrganismName'] = PrimitiveString.transform_json(json_hash['maternalOrganismName'], json_hash['_maternalOrganismName']) unless json_hash['maternalOrganismName'].nil?      
      result['paternalOrganismId'] = PrimitiveString.transform_json(json_hash['paternalOrganismId'], json_hash['_paternalOrganismId']) unless json_hash['paternalOrganismId'].nil?      
      result['paternalOrganismName'] = PrimitiveString.transform_json(json_hash['paternalOrganismName'], json_hash['_paternalOrganismName']) unless json_hash['paternalOrganismName'].nil?      
      result['hybridType'] = CodeableConcept.transform_json(json_hash['hybridType']) unless json_hash['hybridType'].nil?      

      result
    end
  end
end
