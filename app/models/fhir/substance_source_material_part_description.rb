module FHIR
  # fhir/substance_source_material_part_description.rb
  class SubstanceSourceMaterialPartDescription < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialPartDescription'
    embeds_one :part, class_name: 'CodeableConcept'
    embeds_one :partLocation, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = SubstanceSourceMaterialPartDescription.new
      result['part'] = CodeableConcept.transform_json(json_hash['part']) unless json_hash['part'].nil?      
      result['partLocation'] = CodeableConcept.transform_json(json_hash['partLocation']) unless json_hash['partLocation'].nil?      

      result
    end
  end
end
