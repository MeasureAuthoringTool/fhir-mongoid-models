module FHIR
  # fhir/substance_reference_information.rb
  class SubstanceReferenceInformation < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformation'
    embeds_one :comment, class_name: 'PrimitiveString'
    embeds_many :gene, class_name: 'SubstanceReferenceInformationGene'
    embeds_many :geneElement, class_name: 'SubstanceReferenceInformationGeneElement'
    embeds_many :classification, class_name: 'SubstanceReferenceInformationClassification'
    embeds_many :target, class_name: 'SubstanceReferenceInformationTarget'

    def self.transform_json(json_hash, target=SubstanceReferenceInformation.new)
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
