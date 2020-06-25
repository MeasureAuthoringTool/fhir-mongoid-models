module FHIR
  # fhir/medication_request_dispense_request_initial_fill.rb
  class MedicationRequestDispenseRequestInitialFill < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationRequestDispenseRequestInitialFill'
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :duration, class_name: 'Duration'

    def self.transform_json(json_hash)
      result = MedicationRequestDispenseRequestInitialFill.new
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['duration'] = Duration.transform_json(json_hash['duration']) unless json_hash['duration'].nil?      

      result
    end
  end
end
