module FHIR
  # fhir/explanation_of_benefit_item_detail_sub_detail.rb
  class ExplanationOfBenefitItemDetailSubDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitItemDetailSubDetail'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_one :revenue, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_many :programCode, class_name: 'CodeableConcept'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    embeds_one :factor, class_name: 'PrimitiveDecimal'
    embeds_one :net, class_name: 'Money'
    embeds_many :udi, class_name: 'Reference'
    embeds_many :noteNumber, class_name: 'PrimitivePositiveInt'
    embeds_many :adjudication, class_name: 'ExplanationOfBenefitItemAdjudication'

    def self.transform_json(json_hash)
      result = ExplanationOfBenefitItemDetailSubDetail.new
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['revenue'] = CodeableConcept.transform_json(json_hash['revenue']) unless json_hash['revenue'].nil?      
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?      
      result['modifier'] = json_hash['modifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['modifier'].nil?
      result['programCode'] = json_hash['programCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['programCode'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?      
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?      
      result['net'] = Money.transform_json(json_hash['net']) unless json_hash['net'].nil?      
      result['udi'] = json_hash['udi'].map { |var| Reference.transform_json(var) } unless json_hash['udi'].nil?
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ExplanationOfBenefitItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?

      result
    end
  end
end
