module FHIR
  # fhir/dosage.rb
  class Dosage < BackboneElement
    include Mongoid::Document
    embeds_one :sequence, class_name: 'FHIR::PrimitiveInteger'
    embeds_one :text, class_name: 'FHIR::PrimitiveString'
    embeds_many :additionalInstruction, class_name: 'FHIR::CodeableConcept'
    embeds_one :patientInstruction, class_name: 'FHIR::PrimitiveString'
    embeds_one :timing, class_name: 'FHIR::Timing'
    embeds_one :asNeededBoolean, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :asNeededCodeableConcept, class_name: 'FHIR::CodeableConcept'
    embeds_one :site, class_name: 'FHIR::CodeableConcept'
    embeds_one :route, class_name: 'FHIR::CodeableConcept'
    embeds_one :method, class_name: 'FHIR::CodeableConcept'
    embeds_many :doseAndRate, class_name: 'FHIR::DosageDoseAndRate'
    embeds_one :maxDosePerPeriod, class_name: 'FHIR::Ratio'
    embeds_one :maxDosePerAdministration, class_name: 'FHIR::SimpleQuantity'
    embeds_one :maxDosePerLifetime, class_name: 'FHIR::SimpleQuantity'

    def self.transform_json(json_hash, target = Dosage.new)
      result = self.superclass.transform_json(json_hash, target)
      result['sequence'] = PrimitiveInteger.transform_json(json_hash['sequence'], json_hash['_sequence']) unless json_hash['sequence'].nil?      
      result['text'] = PrimitiveString.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      
      result['additionalInstruction'] = json_hash['additionalInstruction'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['additionalInstruction'].nil?
      result['patientInstruction'] = PrimitiveString.transform_json(json_hash['patientInstruction'], json_hash['_patientInstruction']) unless json_hash['patientInstruction'].nil?      
      result['timing'] = Timing.transform_json(json_hash['timing']) unless json_hash['timing'].nil?      
      result['asNeededBoolean'] = PrimitiveBoolean.transform_json(json_hash['asNeededBoolean'], json_hash['_asNeededBoolean']) unless json_hash['asNeededBoolean'].nil?      
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
