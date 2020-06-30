module FHIR
  # fhir/molecular_sequence_variant.rb
  class MolecularSequenceVariant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceVariant'
    embeds_one :start, class_name: 'PrimitiveInteger'
    embeds_one :end, class_name: 'PrimitiveInteger'
    embeds_one :observedAllele, class_name: 'PrimitiveString'
    embeds_one :referenceAllele, class_name: 'PrimitiveString'
    embeds_one :cigar, class_name: 'PrimitiveString'
    embeds_one :variantPointer, class_name: 'Reference'

    def self.transform_json(json_hash, target=MolecularSequenceVariant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['start'] = PrimitiveInteger.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?      
      result['end'] = PrimitiveInteger.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?      
      result['observedAllele'] = PrimitiveString.transform_json(json_hash['observedAllele'], json_hash['_observedAllele']) unless json_hash['observedAllele'].nil?      
      result['referenceAllele'] = PrimitiveString.transform_json(json_hash['referenceAllele'], json_hash['_referenceAllele']) unless json_hash['referenceAllele'].nil?      
      result['cigar'] = PrimitiveString.transform_json(json_hash['cigar'], json_hash['_cigar']) unless json_hash['cigar'].nil?      
      result['variantPointer'] = Reference.transform_json(json_hash['variantPointer']) unless json_hash['variantPointer'].nil?      

      result
    end
  end
end
