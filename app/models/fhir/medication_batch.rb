module FHIR
  # fhir/medication_batch.rb
  class MedicationBatch < BackboneElement
    include Mongoid::Document
    embeds_one :lotNumber, class_name: 'FHIR::PrimitiveString'
    embeds_one :expirationDate, class_name: 'FHIR::PrimitiveDateTime'

    def self.transform_json(json_hash, target = MedicationBatch.new)
      result = self.superclass.transform_json(json_hash, target)
      result['lotNumber'] = PrimitiveString.transform_json(json_hash['lotNumber'], json_hash['_lotNumber']) unless json_hash['lotNumber'].nil?      
      result['expirationDate'] = PrimitiveDateTime.transform_json(json_hash['expirationDate'], json_hash['_expirationDate']) unless json_hash['expirationDate'].nil?      

      result
    end
  end
end
