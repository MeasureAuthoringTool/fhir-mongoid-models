module FHIR
  # fhir/medication_batch.rb
  class MedicationBatch < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationBatch'
    embeds_one :lotNumber, class_name: 'PrimitiveString'
    embeds_one :expirationDate, class_name: 'PrimitiveDateTime'

    def self.transform_json(json_hash)
      result = MedicationBatch.new
      result['lotNumber'] = PrimitiveString.transform_json(json_hash['lotNumber'], json_hash['_lotNumber']) unless json_hash['lotNumber'].nil?      
      result['expirationDate'] = PrimitiveDateTime.transform_json(json_hash['expirationDate'], json_hash['_expirationDate']) unless json_hash['expirationDate'].nil?      

      result
    end
  end
end
