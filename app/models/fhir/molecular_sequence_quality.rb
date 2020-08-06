module FHIR
  # fhir/molecular_sequence_quality.rb
  class MolecularSequenceQuality < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::QualityType'    
    embeds_one :standardSequence, class_name: 'FHIR::CodeableConcept'    
    embeds_one :start, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :end, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :score, class_name: 'FHIR::Quantity'    
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    embeds_one :truthTP, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :queryTP, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :truthFN, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :queryFP, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :gtFP, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :precision, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :recall, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :fScore, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :roc, class_name: 'FHIR::MolecularSequenceQualityRoc'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.standardSequence.nil? 
        result['standardSequence'] = self.standardSequence.as_json(*args)
      end
      unless self.start.nil? 
        result['start'] = self.start.value
        serialized = Extension.serializePrimitiveExtension(self.start)            
        result['_start'] = serialized unless serialized.nil?
      end
      unless self.end.nil? 
        result['end'] = self.end.value
        serialized = Extension.serializePrimitiveExtension(self.end)            
        result['_end'] = serialized unless serialized.nil?
      end
      unless self.score.nil? 
        result['score'] = self.score.as_json(*args)
      end
      unless self.method.nil? 
        result['method'] = self.method.as_json(*args)
      end
      unless self.truthTP.nil? 
        result['truthTP'] = self.truthTP.value
        serialized = Extension.serializePrimitiveExtension(self.truthTP)            
        result['_truthTP'] = serialized unless serialized.nil?
      end
      unless self.queryTP.nil? 
        result['queryTP'] = self.queryTP.value
        serialized = Extension.serializePrimitiveExtension(self.queryTP)            
        result['_queryTP'] = serialized unless serialized.nil?
      end
      unless self.truthFN.nil? 
        result['truthFN'] = self.truthFN.value
        serialized = Extension.serializePrimitiveExtension(self.truthFN)            
        result['_truthFN'] = serialized unless serialized.nil?
      end
      unless self.queryFP.nil? 
        result['queryFP'] = self.queryFP.value
        serialized = Extension.serializePrimitiveExtension(self.queryFP)            
        result['_queryFP'] = serialized unless serialized.nil?
      end
      unless self.gtFP.nil? 
        result['gtFP'] = self.gtFP.value
        serialized = Extension.serializePrimitiveExtension(self.gtFP)            
        result['_gtFP'] = serialized unless serialized.nil?
      end
      unless self.precision.nil? 
        result['precision'] = self.precision.value
        serialized = Extension.serializePrimitiveExtension(self.precision)            
        result['_precision'] = serialized unless serialized.nil?
      end
      unless self.recall.nil? 
        result['recall'] = self.recall.value
        serialized = Extension.serializePrimitiveExtension(self.recall)            
        result['_recall'] = serialized unless serialized.nil?
      end
      unless self.fScore.nil? 
        result['fScore'] = self.fScore.value
        serialized = Extension.serializePrimitiveExtension(self.fScore)            
        result['_fScore'] = serialized unless serialized.nil?
      end
      unless self.roc.nil? 
        result['roc'] = self.roc.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MolecularSequenceQuality.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = QualityType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
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
