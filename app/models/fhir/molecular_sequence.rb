module FHIR
  # fhir/molecular_sequence.rb
  class MolecularSequence < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequence'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :type, class_name: 'SequenceType'
    embeds_one :coordinateSystem, class_name: 'PrimitiveInteger'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :specimen, class_name: 'Reference'
    embeds_one :device, class_name: 'Reference'
    embeds_one :performer, class_name: 'Reference'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_one :referenceSeq, class_name: 'MolecularSequenceReferenceSeq'
    embeds_many :variant, class_name: 'MolecularSequenceVariant'
    embeds_one :observedSeq, class_name: 'PrimitiveString'
    embeds_many :quality, class_name: 'MolecularSequenceQuality'
    embeds_one :readCoverage, class_name: 'PrimitiveInteger'
    embeds_many :repository, class_name: 'MolecularSequenceRepository'
    embeds_many :pointer, class_name: 'Reference'
    embeds_many :structureVariant, class_name: 'MolecularSequenceStructureVariant'

    def self.transform_json(json_hash)
      result = MolecularSequence.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['type'] = SequenceType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['coordinateSystem'] = PrimitiveInteger.transform_json(json_hash['coordinateSystem'], json_hash['_coordinateSystem']) unless json_hash['coordinateSystem'].nil?      
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['specimen'] = Reference.transform_json(json_hash['specimen']) unless json_hash['specimen'].nil?      
      result['device'] = Reference.transform_json(json_hash['device']) unless json_hash['device'].nil?      
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?      
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['referenceSeq'] = MolecularSequenceReferenceSeq.transform_json(json_hash['referenceSeq']) unless json_hash['referenceSeq'].nil?      
      result['variant'] = json_hash['variant'].map { |var| MolecularSequenceVariant.transform_json(var) } unless json_hash['variant'].nil?
      result['observedSeq'] = PrimitiveString.transform_json(json_hash['observedSeq'], json_hash['_observedSeq']) unless json_hash['observedSeq'].nil?      
      result['quality'] = json_hash['quality'].map { |var| MolecularSequenceQuality.transform_json(var) } unless json_hash['quality'].nil?
      result['readCoverage'] = PrimitiveInteger.transform_json(json_hash['readCoverage'], json_hash['_readCoverage']) unless json_hash['readCoverage'].nil?      
      result['repository'] = json_hash['repository'].map { |var| MolecularSequenceRepository.transform_json(var) } unless json_hash['repository'].nil?
      result['pointer'] = json_hash['pointer'].map { |var| Reference.transform_json(var) } unless json_hash['pointer'].nil?
      result['structureVariant'] = json_hash['structureVariant'].map { |var| MolecularSequenceStructureVariant.transform_json(var) } unless json_hash['structureVariant'].nil?

      result
    end
  end
end
