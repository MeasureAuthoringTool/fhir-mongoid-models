module FHIR
  # fhir/clinical_impression_investigation.rb
  class ClinicalImpressionInvestigation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ClinicalImpressionInvestigation'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :item, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = ClinicalImpressionInvestigation.new
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['item'] = json_hash['item'].map { |var| Reference.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
