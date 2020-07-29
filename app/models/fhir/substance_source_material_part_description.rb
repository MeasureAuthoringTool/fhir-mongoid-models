module FHIR
  # fhir/substance_source_material_part_description.rb
  class SubstanceSourceMaterialPartDescription < BackboneElement
    include Mongoid::Document
    embeds_one :part, class_name: 'FHIR::CodeableConcept'    
    embeds_one :partLocation, class_name: 'FHIR::CodeableConcept'    

    def self.transform_json(json_hash, target = SubstanceSourceMaterialPartDescription.new)
      result = self.superclass.transform_json(json_hash, target)
      result['part'] = CodeableConcept.transform_json(json_hash['part']) unless json_hash['part'].nil?
      result['partLocation'] = CodeableConcept.transform_json(json_hash['partLocation']) unless json_hash['partLocation'].nil?

      result
    end
  end
end
