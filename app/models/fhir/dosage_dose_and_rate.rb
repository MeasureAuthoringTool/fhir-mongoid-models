module FHIR
  # fhir/dosage_dose_and_rate.rb
  class DosageDoseAndRate < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'DosageDoseAndRate'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :doseRange, class_name: 'Range'
    embeds_one :doseSimpleQuantity, class_name: 'SimpleQuantity'
    embeds_one :rateRatio, class_name: 'Ratio'
    embeds_one :rateRange, class_name: 'Range'
    embeds_one :rateSimpleQuantity, class_name: 'SimpleQuantity'

    def self.transform_json(json_hash, target=DosageDoseAndRate.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['doseRange'] = Range.transform_json(json_hash['doseRange']) unless json_hash['doseRange'].nil?      
      result['doseSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['doseSimpleQuantity']) unless json_hash['doseSimpleQuantity'].nil?      
      result['rateRatio'] = Ratio.transform_json(json_hash['rateRatio']) unless json_hash['rateRatio'].nil?      
      result['rateRange'] = Range.transform_json(json_hash['rateRange']) unless json_hash['rateRange'].nil?      
      result['rateSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['rateSimpleQuantity']) unless json_hash['rateSimpleQuantity'].nil?      

      result
    end
  end
end
