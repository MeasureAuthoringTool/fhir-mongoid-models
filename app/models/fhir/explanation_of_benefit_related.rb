module FHIR
  # fhir/explanation_of_benefit_related.rb
  class ExplanationOfBenefitRelated < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitRelated'
    embeds_one :claim, class_name: 'Reference'
    embeds_one :relationship, class_name: 'CodeableConcept'
    embeds_one :reference, class_name: 'Identifier'

    def self.transform_json(json_hash)
      result = ExplanationOfBenefitRelated.new
      result['claim'] = Reference.transform_json(json_hash['claim']) unless json_hash['claim'].nil?      
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?      
      result['reference'] = Identifier.transform_json(json_hash['reference']) unless json_hash['reference'].nil?      

      result
    end
  end
end
