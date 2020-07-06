module FHIR
  # fhir/medication.rb
  class Medication < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :status, class_name: 'MedicationStatus'
    embeds_one :manufacturer, class_name: 'Reference'
    embeds_one :form, class_name: 'CodeableConcept'
    embeds_one :amount, class_name: 'Ratio'
    embeds_many :ingredient, class_name: 'MedicationIngredient'
    embeds_one :batch, class_name: 'MedicationBatch'

    def self.transform_json(json_hash, target = Medication.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['status'] = MedicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['manufacturer'] = Reference.transform_json(json_hash['manufacturer']) unless json_hash['manufacturer'].nil?      
      result['form'] = CodeableConcept.transform_json(json_hash['form']) unless json_hash['form'].nil?      
      result['amount'] = Ratio.transform_json(json_hash['amount']) unless json_hash['amount'].nil?      
      result['ingredient'] = json_hash['ingredient'].map { |var| MedicationIngredient.transform_json(var) } unless json_hash['ingredient'].nil?
      result['batch'] = MedicationBatch.transform_json(json_hash['batch']) unless json_hash['batch'].nil?      

      result
    end
  end
end
