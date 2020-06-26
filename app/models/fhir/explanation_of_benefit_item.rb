module FHIR
  # fhir/explanation_of_benefit_item.rb
  class ExplanationOfBenefitItem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExplanationOfBenefitItem'
    embeds_one :sequence, class_name: 'PrimitivePositiveInt'
    embeds_many :careTeamSequence, class_name: 'PrimitivePositiveInt'
    embeds_many :diagnosisSequence, class_name: 'PrimitivePositiveInt'
    embeds_many :procedureSequence, class_name: 'PrimitivePositiveInt'
    embeds_many :informationSequence, class_name: 'PrimitivePositiveInt'
    embeds_one :revenue, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :productOrService, class_name: 'CodeableConcept'
    embeds_many :modifier, class_name: 'CodeableConcept'
    embeds_many :programCode, class_name: 'CodeableConcept'
    embeds_one :serviceddate, class_name: 'PrimitiveDate'
    embeds_one :servicedPeriod, class_name: 'Period'
    embeds_one :locationCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :locationAddress, class_name: 'Address'
    embeds_one :locationReference, class_name: 'Reference'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :unitPrice, class_name: 'Money'
    embeds_one :factor, class_name: 'PrimitiveDecimal'
    embeds_one :net, class_name: 'Money'
    embeds_many :udi, class_name: 'Reference'
    embeds_one :bodySite, class_name: 'CodeableConcept'
    embeds_many :subSite, class_name: 'CodeableConcept'
    embeds_many :encounter, class_name: 'Reference'
    embeds_many :noteNumber, class_name: 'PrimitivePositiveInt'
    embeds_many :adjudication, class_name: 'ExplanationOfBenefitItemAdjudication'
    embeds_many :detail, class_name: 'ExplanationOfBenefitItemDetail'

    def self.transform_json(json_hash)
      result = ExplanationOfBenefitItem.new
      result['sequence'] = PrimitivePositiveInt.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['careTeamSequence'] = json_hash['careTeamSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_careTeamSequence'] && json_hash['_careTeamSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['careTeamSequence'].nil?
      result['diagnosisSequence'] = json_hash['diagnosisSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_diagnosisSequence'] && json_hash['_diagnosisSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['diagnosisSequence'].nil?
      result['procedureSequence'] = json_hash['procedureSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_procedureSequence'] && json_hash['_procedureSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['procedureSequence'].nil?
      result['informationSequence'] = json_hash['informationSequence'].each_with_index.map do |var, i|
        extension_hash = json_hash['_informationSequence'] && json_hash['_informationSequence'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['informationSequence'].nil?
      result['revenue'] = CodeableConcept.transform_json(json_hash['revenue']) unless json_hash['revenue'].nil?      
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['productOrService'] = CodeableConcept.transform_json(json_hash['productOrService']) unless json_hash['productOrService'].nil?      
      result['modifier'] = json_hash['modifier'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['modifier'].nil?
      result['programCode'] = json_hash['programCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['programCode'].nil?
      result['serviceddate'] = PrimitiveDate.transform_json(json_hash['serviceddate'], json_hash['_serviceddate']) unless json_hash['serviceddate'].nil?      
      result['servicedPeriod'] = Period.transform_json(json_hash['servicedPeriod']) unless json_hash['servicedPeriod'].nil?      
      result['locationCodeableConcept'] = CodeableConcept.transform_json(json_hash['locationCodeableConcept']) unless json_hash['locationCodeableConcept'].nil?      
      result['locationAddress'] = Address.transform_json(json_hash['locationAddress']) unless json_hash['locationAddress'].nil?      
      result['locationReference'] = Reference.transform_json(json_hash['locationReference']) unless json_hash['locationReference'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['unitPrice'] = Money.transform_json(json_hash['unitPrice']) unless json_hash['unitPrice'].nil?      
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?      
      result['net'] = Money.transform_json(json_hash['net']) unless json_hash['net'].nil?      
      result['udi'] = json_hash['udi'].map { |var| Reference.transform_json(var) } unless json_hash['udi'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?      
      result['subSite'] = json_hash['subSite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['subSite'].nil?
      result['encounter'] = json_hash['encounter'].map { |var| Reference.transform_json(var) } unless json_hash['encounter'].nil?
      result['noteNumber'] = json_hash['noteNumber'].each_with_index.map do |var, i|
        extension_hash = json_hash['_noteNumber'] && json_hash['_noteNumber'][i]
        PrimitivePositiveInt.transform_json(var, extension_hash)
      end unless json_hash['noteNumber'].nil?
      result['adjudication'] = json_hash['adjudication'].map { |var| ExplanationOfBenefitItemAdjudication.transform_json(var) } unless json_hash['adjudication'].nil?
      result['detail'] = json_hash['detail'].map { |var| ExplanationOfBenefitItemDetail.transform_json(var) } unless json_hash['detail'].nil?

      result
    end
  end
end
