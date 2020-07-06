module FHIR
  # fhir/clinical_impression_finding.rb
  class ClinicalImpressionFinding < BackboneElement
    include Mongoid::Document
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :itemReference, class_name: 'Reference'
    embeds_one :basis, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = ClinicalImpressionFinding.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?      
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?      
      result['basis'] = PrimitiveString.transform_json(json_hash['basis'], json_hash['_basis']) unless json_hash['basis'].nil?      

      result
    end
  end
end
