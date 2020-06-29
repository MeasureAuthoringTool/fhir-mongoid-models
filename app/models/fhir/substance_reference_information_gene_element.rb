module FHIR
  # fhir/substance_reference_information_gene_element.rb
  class SubstanceReferenceInformationGeneElement < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceReferenceInformationGeneElement'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :element, class_name: 'Identifier'
    embeds_many :source, class_name: 'Reference'

    def self.transform_json(json_hash, target=SubstanceReferenceInformationGeneElement.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['element'] = Identifier.transform_json(json_hash['element']) unless json_hash['element'].nil?      
      result['source'] = json_hash['source'].map { |var| Reference.transform_json(var) } unless json_hash['source'].nil?

      result
    end
  end
end
