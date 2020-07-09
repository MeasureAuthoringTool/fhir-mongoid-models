module FHIR
  # fhir/substance_source_material_fraction_description.rb
  class SubstanceSourceMaterialFractionDescription < BackboneElement
    include Mongoid::Document
    embeds_one :fraction, class_name: 'FHIR::PrimitiveString'
    embeds_one :materialType, class_name: 'FHIR::CodeableConcept'

    def self.transform_json(json_hash, target = SubstanceSourceMaterialFractionDescription.new)
      result = self.superclass.transform_json(json_hash, target)
      result['fraction'] = PrimitiveString.transform_json(json_hash['fraction'], json_hash['_fraction']) unless json_hash['fraction'].nil?      
      result['materialType'] = CodeableConcept.transform_json(json_hash['materialType']) unless json_hash['materialType'].nil?      

      result
    end
  end
end
