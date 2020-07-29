module FHIR
  # fhir/claim_related.rb
  class ClaimRelated < BackboneElement
    include Mongoid::Document
    embeds_one :claim, class_name: 'FHIR::Reference'    
    embeds_one :relationship, class_name: 'FHIR::CodeableConcept'    
    embeds_one :reference, class_name: 'FHIR::Identifier'    

    def self.transform_json(json_hash, target = ClaimRelated.new)
      result = self.superclass.transform_json(json_hash, target)
      result['claim'] = Reference.transform_json(json_hash['claim']) unless json_hash['claim'].nil?
      result['relationship'] = CodeableConcept.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?
      result['reference'] = Identifier.transform_json(json_hash['reference']) unless json_hash['reference'].nil?

      result
    end
  end
end
