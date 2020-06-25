module FHIR
  # fhir/medication_administration_dosage.rb
  class MedicationAdministrationDosage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MedicationAdministrationDosage'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_one :site, class_name: 'CodeableConcept'
    embeds_one :route, class_name: 'CodeableConcept'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_one :dose, class_name: 'SimpleQuantity'
    embeds_one :rateRatio, class_name: 'Ratio'
    embeds_one :rateSimpleQuantity, class_name: 'SimpleQuantity'

    def self.transform_json(json_hash)
      result = MedicationAdministrationDosage.new
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['site'] = CodeableConcept.transform_json(json_hash['site']) unless json_hash['site'].nil?      
      result['route'] = CodeableConcept.transform_json(json_hash['route']) unless json_hash['route'].nil?      
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?      
      result['dose'] = SimpleQuantity.transform_json(json_hash['dose']) unless json_hash['dose'].nil?      
      result['rateRatio'] = Ratio.transform_json(json_hash['rateRatio']) unless json_hash['rateRatio'].nil?      
      result['rateSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['rateSimpleQuantity']) unless json_hash['rateSimpleQuantity'].nil?      

      result
    end
  end
end
