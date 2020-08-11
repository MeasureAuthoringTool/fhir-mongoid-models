module FHIR
  # fhir/substance_reference_information_gene.rb
  class SubstanceReferenceInformationGene < BackboneElement
    include Mongoid::Document
    embeds_one :geneSequenceOrigin, class_name: 'FHIR::CodeableConcept'    
    embeds_one :gene, class_name: 'FHIR::CodeableConcept'    
    embeds_many :source, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.geneSequenceOrigin.nil? 
        result['geneSequenceOrigin'] = self.geneSequenceOrigin.as_json(*args)
      end
      unless self.gene.nil? 
        result['gene'] = self.gene.as_json(*args)
      end
      unless self.source.nil?  || !self.source.any? 
        result['source'] = self.source.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceReferenceInformationGene.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['geneSequenceOrigin'] = CodeableConcept.transform_json(json_hash['geneSequenceOrigin']) unless json_hash['geneSequenceOrigin'].nil?
      result['gene'] = CodeableConcept.transform_json(json_hash['gene']) unless json_hash['gene'].nil?
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
