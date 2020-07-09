module FHIR
  # fhir/clinical_impression_investigation.rb
  class ClinicalImpressionInvestigation < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_many :item, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = ClinicalImpressionInvestigation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['item'] = json_hash['item'].map { |var| Reference.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
