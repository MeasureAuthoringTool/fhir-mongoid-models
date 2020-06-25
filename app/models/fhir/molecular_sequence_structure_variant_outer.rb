module FHIR
  # fhir/molecular_sequence_structure_variant_outer.rb
  class MolecularSequenceStructureVariantOuter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceStructureVariantOuter'
    embeds_one :start, class_name: 'PrimitiveInteger'
    embeds_one :end, class_name: 'PrimitiveInteger'

    def self.transform_json(json_hash)
      result = MolecularSequenceStructureVariantOuter.new
      result['start'] = PrimitiveInteger.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?      
      result['end'] = PrimitiveInteger.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?      

      result
    end
  end
end
