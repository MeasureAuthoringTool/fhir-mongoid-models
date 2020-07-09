module FHIR
  # fhir/molecular_sequence_structure_variant_inner.rb
  class MolecularSequenceStructureVariantInner < BackboneElement
    include Mongoid::Document
    embeds_one :start, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :end, class_name: 'FHIR::PrimitiveInteger'

    def self.transform_json(json_hash, target = MolecularSequenceStructureVariantInner.new)
      result = self.superclass.transform_json(json_hash, target)
      result['start'] = PrimitiveInteger.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?      
      result['end'] = PrimitiveInteger.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?      

      result
    end
  end
end
