module FHIR
  # fhir/explanation_of_benefit_accident.rb
  class ExplanationOfBenefitAccident < BackboneElement
    include Mongoid::Document
    embeds_one :date, class_name: 'FHIR::PrimitiveDate'
    embeds_one :type, class_name: 'FHIR::CodeableConcept'
    embeds_one :locationAddress, class_name: 'FHIR::Address'
    embeds_one :locationReference, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = ExplanationOfBenefitAccident.new)
      result = self.superclass.transform_json(json_hash, target)
      result['date'] = PrimitiveDate.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['locationAddress'] = Address.transform_json(json_hash['locationAddress']) unless json_hash['locationAddress'].nil?      
      result['locationReference'] = Reference.transform_json(json_hash['locationReference']) unless json_hash['locationReference'].nil?      

      result
    end
  end
end
