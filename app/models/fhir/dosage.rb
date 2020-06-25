module FHIR
  # fhir/dosage.rb
  class Dosage < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'Dosage'
    embeds_one :sequence, class_name: 'PrimitiveInteger'
    embeds_one :text, class_name: 'PrimitiveString'
    embeds_many :additionalInstruction, class_name: 'CodeableConcept'
    embeds_one :patientInstruction, class_name: 'PrimitiveString'
    embeds_one :timing, class_name: 'Timing'
    embeds_one :asNeededboolean, class_name: 'PrimitiveBoolean'
    embeds_one :asNeededCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :site, class_name: 'CodeableConcept'
    embeds_one :route, class_name: 'CodeableConcept'
    embeds_one :method, class_name: 'CodeableConcept'
    embeds_many :doseAndRate, class_name: 'DosageDoseAndRate'
    embeds_one :maxDosePerPeriod, class_name: 'Ratio'
    embeds_one :maxDosePerAdministration, class_name: 'SimpleQuantity'
    embeds_one :maxDosePerLifetime, class_name: 'SimpleQuantity'

    def self.transform_json(json_hash)
      result = Dosage.new
      result['sequence'] = PrimitiveInteger.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['additionalInstruction'] = json_hash['additionalInstruction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['additionalInstruction'].nil?
      result['patientInstruction'] = PrimitiveString.transform_json(json_hash['patientInstruction'], json_hash['_patientInstruction']) unless json_hash['patientInstruction'].nil?      
      result['timing'] = Timing.transform_json(json_hash['timing']) unless json_hash['timing'].nil?      
      result['asNeededboolean'] = PrimitiveBoolean.transform_json(json_hash['asNeededboolean'], json_hash['_asNeededboolean']) unless json_hash['asNeededboolean'].nil?      
      result['asNeededCodeableConcept'] = CodeableConcept.transform_json(json_hash['asNeededCodeableConcept']) unless json_hash['asNeededCodeableConcept'].nil?      
      result['site'] = CodeableConcept.transform_json(json_hash['site']) unless json_hash['site'].nil?      
      result['route'] = CodeableConcept.transform_json(json_hash['route']) unless json_hash['route'].nil?      
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?      
      result['doseAndRate'] = json_hash['doseAndRate'].map { |var| DosageDoseAndRate.transform_json(var) } unless json_hash['doseAndRate'].nil?
      result['maxDosePerPeriod'] = Ratio.transform_json(json_hash['maxDosePerPeriod']) unless json_hash['maxDosePerPeriod'].nil?      
      result['maxDosePerAdministration'] = SimpleQuantity.transform_json(json_hash['maxDosePerAdministration']) unless json_hash['maxDosePerAdministration'].nil?      
      result['maxDosePerLifetime'] = SimpleQuantity.transform_json(json_hash['maxDosePerLifetime']) unless json_hash['maxDosePerLifetime'].nil?      

      result
    end
  end
end
