module FHIR
  # fhir/charge_item.rb
  class ChargeItem < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :definitionUri, class_name: 'PrimitiveUri'
    embeds_many :definitionCanonical, class_name: 'PrimitiveCanonical'
    embeds_one :status, class_name: 'ChargeItemStatus'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :context, class_name: 'Reference'
    embeds_one :occurrenceDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :occurrencePeriod, class_name: 'Period'
    embeds_one :occurrenceTiming, class_name: 'Timing'
    embeds_many :performer, class_name: 'ChargeItemPerformer'
    embeds_one :performingOrganization, class_name: 'Reference'
    embeds_one :requestingOrganization, class_name: 'Reference'
    embeds_one :costCenter, class_name: 'Reference'
    embeds_one :quantity, class_name: 'Quantity'
    embeds_many :bodysite, class_name: 'CodeableConcept'
    embeds_one :factorOverride, class_name: 'PrimitiveDecimal'
    embeds_one :priceOverride, class_name: 'Money'
    embeds_one :overrideReason, class_name: 'PrimitiveString'
    embeds_one :enterer, class_name: 'Reference'
    embeds_one :enteredDate, class_name: 'PrimitiveDateTime'
    embeds_many :reason, class_name: 'CodeableConcept'
    embeds_many :service, class_name: 'Reference'
    embeds_one :productReference, class_name: 'Reference'
    embeds_one :productCodeableConcept, class_name: 'CodeableConcept'
    embeds_many :account, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :supportingInformation, class_name: 'Reference'

    def self.transform_json(json_hash, target = ChargeItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['definitionUri'] = json_hash['definitionUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_definitionUri'] && json_hash['_definitionUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['definitionUri'].nil?
      result['definitionCanonical'] = json_hash['definitionCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_definitionCanonical'] && json_hash['_definitionCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['definitionCanonical'].nil?
      result['status'] = ChargeItemStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['context'] = Reference.transform_json(json_hash['context']) unless json_hash['context'].nil?      
      result['occurrenceDateTime'] = PrimitiveDateTime.transform_json(json_hash['occurrenceDateTime'], json_hash['_occurrenceDateTime']) unless json_hash['occurrenceDateTime'].nil?      
      result['occurrencePeriod'] = Period.transform_json(json_hash['occurrencePeriod']) unless json_hash['occurrencePeriod'].nil?      
      result['occurrenceTiming'] = Timing.transform_json(json_hash['occurrenceTiming']) unless json_hash['occurrenceTiming'].nil?      
      result['performer'] = json_hash['performer'].map { |var| ChargeItemPerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['performingOrganization'] = Reference.transform_json(json_hash['performingOrganization']) unless json_hash['performingOrganization'].nil?      
      result['requestingOrganization'] = Reference.transform_json(json_hash['requestingOrganization']) unless json_hash['requestingOrganization'].nil?      
      result['costCenter'] = Reference.transform_json(json_hash['costCenter']) unless json_hash['costCenter'].nil?      
      result['quantity'] = Quantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['bodysite'] = json_hash['bodysite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['bodysite'].nil?
      result['factorOverride'] = PrimitiveDecimal.transform_json(json_hash['factorOverride'], json_hash['_factorOverride']) unless json_hash['factorOverride'].nil?      
      result['priceOverride'] = Money.transform_json(json_hash['priceOverride']) unless json_hash['priceOverride'].nil?      
      result['overrideReason'] = PrimitiveString.transform_json(json_hash['overrideReason'], json_hash['_overrideReason']) unless json_hash['overrideReason'].nil?      
      result['enterer'] = Reference.transform_json(json_hash['enterer']) unless json_hash['enterer'].nil?      
      result['enteredDate'] = PrimitiveDateTime.transform_json(json_hash['enteredDate'], json_hash['_enteredDate']) unless json_hash['enteredDate'].nil?      
      result['reason'] = json_hash['reason'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reason'].nil?
      result['service'] = json_hash['service'].map { |var| Reference.transform_json(var) } unless json_hash['service'].nil?
      result['productReference'] = Reference.transform_json(json_hash['productReference']) unless json_hash['productReference'].nil?      
      result['productCodeableConcept'] = CodeableConcept.transform_json(json_hash['productCodeableConcept']) unless json_hash['productCodeableConcept'].nil?      
      result['account'] = json_hash['account'].map { |var| Reference.transform_json(var) } unless json_hash['account'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['supportingInformation'] = json_hash['supportingInformation'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInformation'].nil?

      result
    end
  end
end
