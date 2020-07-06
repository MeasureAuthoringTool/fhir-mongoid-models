module FHIR
  # fhir/molecular_sequence_quality.rb
  class MolecularSequenceQuality < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'QualityType'
    embeds_one :standardSequence, class_name: 'CodeableConcept'
    embeds_one :start, class_name: 'PrimitiveInteger'
    embeds_one :end, class_name: 'PrimitiveInteger'
    embeds_one :score, class_name: 'Quantity'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :truthTP, class_name: 'PrimitiveDecimal'
    embeds_one :queryTP, class_name: 'PrimitiveDecimal'
    embeds_one :truthFN, class_name: 'PrimitiveDecimal'
    embeds_one :queryFP, class_name: 'PrimitiveDecimal'
    embeds_one :gtFP, class_name: 'PrimitiveDecimal'
    embeds_one :precision, class_name: 'PrimitiveDecimal'
    embeds_one :recall, class_name: 'PrimitiveDecimal'
    embeds_one :fScore, class_name: 'PrimitiveDecimal'
    embeds_one :roc, class_name: 'MolecularSequenceQualityRoc'

    def self.transform_json(json_hash, target = MolecularSequenceQuality.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = QualityType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['standardSequence'] = CodeableConcept.transform_json(json_hash['standardSequence']) unless json_hash['standardSequence'].nil?      
      result['start'] = PrimitiveInteger.transform_json(json_hash['start'], json_hash['_start']) unless json_hash['start'].nil?      
      result['end'] = PrimitiveInteger.transform_json(json_hash['end'], json_hash['_end']) unless json_hash['end'].nil?      
      result['score'] = Quantity.transform_json(json_hash['score']) unless json_hash['score'].nil?      
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?      
      result['truthTP'] = PrimitiveDecimal.transform_json(json_hash['truthTP'], json_hash['_truthTP']) unless json_hash['truthTP'].nil?      
      result['queryTP'] = PrimitiveDecimal.transform_json(json_hash['queryTP'], json_hash['_queryTP']) unless json_hash['queryTP'].nil?      
      result['truthFN'] = PrimitiveDecimal.transform_json(json_hash['truthFN'], json_hash['_truthFN']) unless json_hash['truthFN'].nil?      
      result['queryFP'] = PrimitiveDecimal.transform_json(json_hash['queryFP'], json_hash['_queryFP']) unless json_hash['queryFP'].nil?      
      result['gtFP'] = PrimitiveDecimal.transform_json(json_hash['gtFP'], json_hash['_gtFP']) unless json_hash['gtFP'].nil?      
      result['precision'] = PrimitiveDecimal.transform_json(json_hash['precision'], json_hash['_precision']) unless json_hash['precision'].nil?      
      result['recall'] = PrimitiveDecimal.transform_json(json_hash['recall'], json_hash['_recall']) unless json_hash['recall'].nil?      
      result['fScore'] = PrimitiveDecimal.transform_json(json_hash['fScore'], json_hash['_fScore']) unless json_hash['fScore'].nil?      
      result['roc'] = MolecularSequenceQualityRoc.transform_json(json_hash['roc']) unless json_hash['roc'].nil?      

      result
    end
  end
end
