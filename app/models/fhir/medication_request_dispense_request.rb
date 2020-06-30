module FHIR
  # fhir/medication_request_dispense_request.rb
  class MedicationRequestDispenseRequest < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestDispenseRequest'
    embeds_one :initialFill, class_name: 'MedicationRequestDispenseRequestInitialFill'
    embeds_one :dispenseInterval, class_name: 'Duration'
    embeds_one :validityPeriod, class_name: 'Period'
    embeds_one :numberOfRepeatsAllowed, class_name: 'PrimitiveUnsignedInt'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :expectedSupplyDuration, class_name: 'Duration'
    embeds_one :performer, class_name: 'Reference'

    def self.transform_json(json_hash, target=MedicationRequestDispenseRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['initialFill'] = MedicationRequestDispenseRequestInitialFill.transform_json(json_hash['initialFill']) unless json_hash['initialFill'].nil?      
      result['dispenseInterval'] = Duration.transform_json(json_hash['dispenseInterval']) unless json_hash['dispenseInterval'].nil?      
      result['validityPeriod'] = Period.transform_json(json_hash['validityPeriod']) unless json_hash['validityPeriod'].nil?      
      result['numberOfRepeatsAllowed'] = PrimitiveUnsignedInt.transform_json(json_hash['numberOfRepeatsAllowed'], json_hash['_numberOfRepeatsAllowed']) unless json_hash['numberOfRepeatsAllowed'].nil?      
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['expectedSupplyDuration'] = Duration.transform_json(json_hash['expectedSupplyDuration']) unless json_hash['expectedSupplyDuration'].nil?      
      result['performer'] = Reference.transform_json(json_hash['performer']) unless json_hash['performer'].nil?      

      result
    end
  end
end
