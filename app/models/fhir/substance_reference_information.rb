module FHIR
  # fhir/substance_reference_information.rb
  class SubstanceReferenceInformation < DomainResource
    include Mongoid::Document
    embeds_one :comment, class_name: 'FHIR::PrimitiveString'    
    embeds_many :gene, class_name: 'FHIR::SubstanceReferenceInformationGene'    
    embeds_many :geneElement, class_name: 'FHIR::SubstanceReferenceInformationGeneElement'    
    embeds_many :classification, class_name: 'FHIR::SubstanceReferenceInformationClassification'    
    embeds_many :target, class_name: 'FHIR::SubstanceReferenceInformationTarget'    

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
