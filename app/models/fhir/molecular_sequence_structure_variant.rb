module FHIR
  # fhir/molecular_sequence_structure_variant.rb
  class MolecularSequenceStructureVariant < BackboneElement
    include Mongoid::Document
    embeds_one :variantType, class_name: 'FHIR::CodeableConcept'
    embeds_one :exact, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :length, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :outer, class_name: 'FHIR::MolecularSequenceStructureVariantOuter'
    embeds_one :inner, class_name: 'FHIR::MolecularSequenceStructureVariantInner'

    def self.transform_json(json_hash, target = MolecularSequenceStructureVariant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['variantType'] = CodeableConcept.transform_json(json_hash['variantType']) unless json_hash['variantType'].nil?      
      result['exact'] = PrimitiveBoolean.transform_json(json_hash['exact'], json_hash['_exact']) unless json_hash['exact'].nil?      
      result['length'] = PrimitiveInteger.transform_json(json_hash['length'], json_hash['_length']) unless json_hash['length'].nil?      
      result['outer'] = MolecularSequenceStructureVariantOuter.transform_json(json_hash['outer']) unless json_hash['outer'].nil?      
      result['inner'] = MolecularSequenceStructureVariantInner.transform_json(json_hash['inner']) unless json_hash['inner'].nil?      

      result
    end
  end
end
