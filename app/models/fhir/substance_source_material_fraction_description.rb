module FHIR
  # fhir/substance_source_material_fraction_description.rb
  class SubstanceSourceMaterialFractionDescription < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceSourceMaterialFractionDescription'
    embeds_one :fraction, class_name: 'PrimitiveString'
    embeds_one :materialType, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = SubstanceSourceMaterialFractionDescription.new
      result['fraction'] = PrimitiveString.transform_json(json_hash['fraction'], json_hash['_fraction']) unless json_hash['fraction'].nil?      
      result['materialType'] = CodeableConcept.transform_json(json_hash['materialType']) unless json_hash['materialType'].nil?      

      result
    end
  end
end
