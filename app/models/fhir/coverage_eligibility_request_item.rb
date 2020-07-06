module FHIR
  # fhir/coverage_eligibility_request_item.rb
  class CoverageEligibilityRequestItem < BackboneElement
    include Mongoid::Document
    embeds_many :supportingInfoSequence, class_name: 'PrimitivePositiveInt'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_one :provider, class_name: 'Reference'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    embeds_one :facility, class_name: 'Reference'
    embeds_many :diagnosis, class_name: 'CoverageEligibilityRequestItemDiagnosis'
    embeds_many :detail, class_name: 'Reference'

    def self.transform_json(json_hash, target = CoverageEligibilityRequestItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['supportingInfoSequence'] = json_hash['supportingInfoSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_supportingInfoSequence'] && json_hash['_supportingInfoSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['supportingInfoSequence'].nil?
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?      
      result['modifier'] = json_hash['modifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['modifier'].nil?
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?      
      result['facility'] = Reference.transform_json(json_hash['facility']) unless json_hash['facility'].nil?      
      result['diagnosis'] = json_hash['diagnosis'].map { |var| CoverageEligibilityRequestItemDiagnosis.transform_json(var) } unless json_hash['diagnosis'].nil?
      result['detail'] = json_hash['detail'].map { |var| Reference.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
