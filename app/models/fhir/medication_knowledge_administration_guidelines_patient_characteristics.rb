module FHIR
  # fhir/medication_knowledge_administration_guidelines_patient_characteristics.rb
  class MedicationKnowledgeAdministrationGuidelinesPatientCharacteristics < BackboneElement
    include Mongoid::Document
    embeds_one :characteristicCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :characteristicSimpleQuantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_many :value, class_name: 'FHIR::PrimitiveString'    

    def self.transform_json(json_hash, target = MedicationKnowledgeAdministrationGuidelinesPatientCharacteristics.new)
      result = self.superclass.transform_json(json_hash, target)
      result['characteristicCodeableConcept'] = CodeableConcept.transform_json(json_hash['characteristicCodeableConcept']) unless json_hash['characteristicCodeableConcept'].nil?
      result['characteristicSimpleQuantity'] = SimpleQuantity.transform_json(json_hash['characteristicSimpleQuantity']) unless json_hash['characteristicSimpleQuantity'].nil?
      result['value'] = json_hash['value'].each_with_index.map do |var, i|
        extension_hash = json_hash['_value'] && json_hash['_value'][i]
        PrimitiveString.transform_json(var, extension_hash)
      end unless json_hash['value'].nil?

      result
    end
  end
end
