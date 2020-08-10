module FHIR
  # fhir/substance_reference_information.rb
  class SubstanceReferenceInformation < DomainResource
    include Mongoid::Document
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_many :gene, class_name: 'FHIR::SubstanceReferenceInformationGene'    
    embeds_many :geneElement, class_name: 'FHIR::SubstanceReferenceInformationGeneElement'    
    embeds_many :classification, class_name: 'FHIR::SubstanceReferenceInformationClassification'    
    embeds_many :target, class_name: 'FHIR::SubstanceReferenceInformationTarget'    
    
    def as_json(*args)
      result = super      
      unless self.comment.nil? 
        result['comment'] = self.comment.value
        serialized = Extension.serializePrimitiveExtension(self.comment)            
        result['_comment'] = serialized unless serialized.nil?
      end
      unless self.gene.nil?  || !self.gene.any? 
        result['gene'] = self.gene.map{ |x| x.as_json(*args) }
      end
      unless self.geneElement.nil?  || !self.geneElement.any? 
        result['geneElement'] = self.geneElement.map{ |x| x.as_json(*args) }
      end
      unless self.classification.nil?  || !self.classification.any? 
        result['classification'] = self.classification.map{ |x| x.as_json(*args) }
      end
      unless self.target.nil?  || !self.target.any? 
        result['target'] = self.target.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceReferenceInformation.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?
      result['gene'] = json_hash['gene'].map { |var| SubstanceReferenceInformationGene.transform_json(var) } unless json_hash['gene'].nil?
      result['geneElement'] = json_hash['geneElement'].map { |var| SubstanceReferenceInformationGeneElement.transform_json(var) } unless json_hash['geneElement'].nil?
      result['classification'] = json_hash['classification'].map { |var| SubstanceReferenceInformationClassification.transform_json(var) } unless json_hash['classification'].nil?
      result['target'] = json_hash['target'].map { |var| SubstanceReferenceInformationTarget.transform_json(var) } unless json_hash['target'].nil?

      result
    end
  end
end
