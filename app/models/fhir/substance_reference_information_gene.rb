module FHIR
  # fhir/substance_reference_information_gene.rb
  class SubstanceReferenceInformationGene < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformationGene'
    embeds_one :geneSequenceOrigin, class_name: 'CodeableConcept'
    embeds_one :gene, class_name: 'CodeableConcept'
    embeds_many :source, class_name: 'Reference'

    def self.transform_json(json_hash, target=SubstanceReferenceInformationGene.new)
      result = self.superclass.transform_json(json_hash, target)
      result['geneSequenceOrigin'] = CodeableConcept.transform_json(json_hash['geneSequenceOrigin']) unless json_hash['geneSequenceOrigin'].nil?      
      result['gene'] = CodeableConcept.transform_json(json_hash['gene']) unless json_hash['gene'].nil?      
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
