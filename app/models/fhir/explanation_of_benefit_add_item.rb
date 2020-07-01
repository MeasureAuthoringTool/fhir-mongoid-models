module FHIR
  # fhir/explanation_of_benefit_add_item.rb
  class ExplanationOfBenefitAddItem < BackboneElement
    include Mongoid::Document
    embeds_many :itemSequence, class_name: 'PrimitivePositiveInt'
    embeds_many :detailSequence, class_name: 'PrimitivePositiveInt'
    embeds_many :subDetailSequence, class_name: 'PrimitivePositiveInt'
    embeds_many :provider, class_name: 'Reference'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_many :programCode, class_name: 'CodeableConcept'
    embeds_one :servicedDate, class_name: 'PrimitiveDate'
    embeds_one :servicedPeriod, class_name: 'Period'
    embeds_one :locationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :locationAddress, class_name: 'Address'
    embeds_one :locationReference, class_name: 'Reference'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    embeds_one :factor, class_name: 'PrimitiveDecimal'
    embeds_one :net, class_name: 'Money'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_many :subSite, class_name: 'CodeableConcept'
    embeds_many :noteNumber, class_name: 'PrimitivePositiveInt'
    embeds_many :adjudication, class_name: 'ExplanationOfBenefitItemAdjudication'
    embeds_many :detail, class_name: 'ExplanationOfBenefitAddItemDetail'

    def self.transform_json(json_hash, target = ExplanationOfBenefitAddItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemSequence'] = json_hash['itemSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_itemSequence'] && json_hash['_itemSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['itemSequence'].nil?
      result['detailSequence'] = json_hash['detailSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_detailSequence'] && json_hash['_detailSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['detailSequence'].nil?
      result['subDetailSequence'] = json_hash['subDetailSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_subDetailSequence'] && json_hash['_subDetailSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['subDetailSequence'].nil?
      result['provider'] = json_hash['provider'].map { |var| Reference.transform_json(var) } unless json_hash['provider'].nil?
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?      
      result['modifier'] = json_hash['modifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['modifier'].nil?
      result['programCode'] = json_hash['programCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['programCode'].nil?
      result['servicedDate'] = PrimitiveDate.transform_json(json_hash['servicedDate'], json_hash['_servicedDate']) unless json_hash['servicedDate'].nil?      
      result['servicedPeriod'] = Period.transform_json(json_hash['servicedPeriod']) unless json_hash['servicedPeriod'].nil?      
      result['locationCodeableConcept'] = CodeableConcept.transform_json(json_hash['locationCodeableConcept']) unless json_hash['locationCodeableConcept'].nil?      
      result['locationAddress'] = Address.transform_json(json_hash['locationAddress']) unless json_hash['locationAddress'].nil?      
      result['locationReference'] = Reference.transform_json(json_hash['locationReference']) unless json_hash['locationReference'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?      
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?      
      result['net'] = Money.transform_json(json_hash['net']) unless json_hash['net'].nil?      
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?      
      result['subSite'] = json_hash['subSite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subSite'].nil?
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ExplanationOfBenefitItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['detail'] = json_hash['detail'].map { |var| ExplanationOfBenefitAddItemDetail.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
