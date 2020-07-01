module FHIR
  # fhir/substance_source_material_organism_author.rb
  class SubstanceSourceMaterialOrganismAuthor < BackboneElement
    include Mongoid::Document
    embeds_one :authorType, class_name: 'CodeableConcept'
    embeds_one :authorDescription, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = SubstanceSourceMaterialOrganismAuthor.new)
      result = self.superclass.transform_json(json_hash, target)
      result['authorType'] = CodeableConcept.transform_json(json_hash['authorType']) unless json_hash['authorType'].nil?      
      result['authorDescription'] = PrimitiveString.transform_json(json_hash['authorDescription'], json_hash['_authorDescription']) unless json_hash['authorDescription'].nil?      

      result
    end
  end
end
