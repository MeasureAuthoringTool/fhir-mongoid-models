module FHIR
  # fhir/molecular_sequence_quality_roc.rb
  class MolecularSequenceQualityRoc < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MolecularSequenceQualityRoc'
    embeds_many :score, class_name: 'PrimitiveInteger'
    embeds_many :numTP, class_name: 'PrimitiveInteger'
    embeds_many :numFP, class_name: 'PrimitiveInteger'
    embeds_many :numFN, class_name: 'PrimitiveInteger'
    embeds_many :precision, class_name: 'PrimitiveDecimal'
    embeds_many :sensitivity, class_name: 'PrimitiveDecimal'
    embeds_many :fMeasure, class_name: 'PrimitiveDecimal'

    def self.transform_json(json_hash, target=MolecularSequenceQualityRoc.new)
      result = self.superclass.transform_json(json_hash, target)
      result['score'] = json_hash['score'].each_with_index.map do |var, i|
        extension_hash = json_hash['_score'] && json_hash['_score'][i]
        PrimitiveInteger.transform_json(var, extension_hash)
      end unless json_hash['score'].nil?
      result['numTP'] = json_hash['numTP'].each_with_index.map do |var, i|
        extension_hash = json_hash['_numTP'] && json_hash['_numTP'][i]
        PrimitiveInteger.transform_json(var, extension_hash)
      end unless json_hash['numTP'].nil?
      result['numFP'] = json_hash['numFP'].each_with_index.map do |var, i|
        extension_hash = json_hash['_numFP'] && json_hash['_numFP'][i]
        PrimitiveInteger.transform_json(var, extension_hash)
      end unless json_hash['numFP'].nil?
      result['numFN'] = json_hash['numFN'].each_with_index.map do |var, i|
        extension_hash = json_hash['_numFN'] && json_hash['_numFN'][i]
        PrimitiveInteger.transform_json(var, extension_hash)
      end unless json_hash['numFN'].nil?
      result['precision'] = json_hash['precision'].each_with_index.map do |var, i|
        extension_hash = json_hash['_precision'] && json_hash['_precision'][i]
        PrimitiveDecimal.transform_json(var, extension_hash)
      end unless json_hash['precision'].nil?
      result['sensitivity'] = json_hash['sensitivity'].each_with_index.map do |var, i|
        extension_hash = json_hash['_sensitivity'] && json_hash['_sensitivity'][i]
        PrimitiveDecimal.transform_json(var, extension_hash)
      end unless json_hash['sensitivity'].nil?
      result['fMeasure'] = json_hash['fMeasure'].each_with_index.map do |var, i|
        extension_hash = json_hash['_fMeasure'] && json_hash['_fMeasure'][i]
        PrimitiveDecimal.transform_json(var, extension_hash)
      end unless json_hash['fMeasure'].nil?

      result
    end
  end
end
