module FHIR
  # fhir/care_plan_activity_detail.rb
  class CarePlanActivityDetail < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlanActivityDetail'
    embeds_one :kind, class_name: 'CarePlanActivityKind'
    embeds_many :instantiatesCanonical, class_name: 'PrimitiveCanonical'
    embeds_many :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :goal, class_name: 'Reference'
    embeds_one :status, class_name: 'CarePlanActivityStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :doNotPerform, class_name: 'PrimitiveBoolean'
    embeds_one :scheduledTiming, class_name: 'Timing'
    embeds_one :scheduledPeriod, class_name: 'Period'
    embeds_one :scheduledString, class_name: 'PrimitiveString'
    embeds_one :location, class_name: 'Reference'
    embeds_many :performer, class_name: 'Reference'
    embeds_one :productCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :productReference, class_name: 'Reference'
    embeds_one :dailyAmount, class_name: 'SimpleQuantity'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :description, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=CarePlanActivityDetail.new)
      result = self.superclass.transform_json(json_hash, target)
      result['kind'] = CarePlanActivityKind.transform_json(json_hash['kind']) unless json_hash['kind'].nil?      
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['goal'] = json_hash['goal'].map { |var| Reference.transform_json(var) } unless json_hash['goal'].nil?
      result['status'] = CarePlanActivityStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?      
      result['doNotPerform'] = PrimitiveBoolean.transform_json(json_hash['doNotPerform'], json_hash['_doNotPerform']) unless json_hash['doNotPerform'].nil?      
      result['scheduledTiming'] = Timing.transform_json(json_hash['scheduledTiming']) unless json_hash['scheduledTiming'].nil?      
      result['scheduledPeriod'] = Period.transform_json(json_hash['scheduledPeriod']) unless json_hash['scheduledPeriod'].nil?      
      result['scheduledString'] = PrimitiveString.transform_json(json_hash['scheduledString'], json_hash['_scheduledString']) unless json_hash['scheduledString'].nil?      
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['performer'] = json_hash['performer'].map { |var| Reference.transform_json(var) } unless json_hash['performer'].nil?
      result['productCodeableConcept'] = CodeableConcept.transform_json(json_hash['productCodeableConcept']) unless json_hash['productCodeableConcept'].nil?      
      result['productReference'] = Reference.transform_json(json_hash['productReference']) unless json_hash['productReference'].nil?      
      result['dailyAmount'] = SimpleQuantity.transform_json(json_hash['dailyAmount']) unless json_hash['dailyAmount'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      

      result
    end
  end
end
