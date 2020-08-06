module FHIR
  # fhir/molecular_sequence_quality_roc.rb
  class MolecularSequenceQualityRoc < BackboneElement
    include Mongoid::Document
    embeds_many :score, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :numTP, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :numFP, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :numFN, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :precision, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_many :sensitivity, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_many :fMeasure, class_name: 'FHIR::PrimitiveDecimal'    
    
    def as_json(*args)
      result = super      
      unless self.score.nil?  || !self.score.any? 
        result['score'] = self.score.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.score)                              
        result['_score'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.numTP.nil?  || !self.numTP.any? 
        result['numTP'] = self.numTP.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.numTP)                              
        result['_numTP'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.numFP.nil?  || !self.numFP.any? 
        result['numFP'] = self.numFP.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.numFP)                              
        result['_numFP'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.numFN.nil?  || !self.numFN.any? 
        result['numFN'] = self.numFN.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.numFN)                              
        result['_numFN'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.precision.nil?  || !self.precision.any? 
        result['precision'] = self.precision.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.precision)                              
        result['_precision'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.sensitivity.nil?  || !self.sensitivity.any? 
        result['sensitivity'] = self.sensitivity.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.sensitivity)                              
        result['_sensitivity'] = serialized unless serialized.nil? || !serialized.any?
      end
      unless self.fMeasure.nil?  || !self.fMeasure.any? 
        result['fMeasure'] = self.fMeasure.compact().map{ |x| x.value }
        serialized = Extension.serializePrimitiveExtensionArray(self.fMeasure)                              
        result['_fMeasure'] = serialized unless serialized.nil? || !serialized.any?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MolecularSequenceQualityRoc.new)
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
