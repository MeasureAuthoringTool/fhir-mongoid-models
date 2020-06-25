module FHIR
  # fhir/explanation_of_benefit_add_item_detail_sub_detail.rb
  class ExplanationOfBenefitAddItemDetailSubDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitAddItemDetailSubDetail'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    embeds_one :factor, class_name: 'PrimitiveDecimal'
    embeds_one :net, class_name: 'Money'
    embeds_many :noteNumber, class_name: 'PrimitivePositiveInt'
    embeds_many :adjudication, class_name: 'ExplanationOfBenefitItemAdjudication'

    def self.transform_json(json_hash)
      result = ExplanationOfBenefitAddItemDetailSubDetail.new
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?      
      result['modifier'] = json_hash['modifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['modifier'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?      
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?      
      result['net'] = Money.transform_json(json_hash['net']) unless json_hash['net'].nil?      
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ExplanationOfBenefitItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?

      result
    end
  end
end
