module FHIR
  # fhir/medicinal_product_indication.rb
  class MedicinalProductIndication < DomainResource
    include Mongoid::Document
    embeds_many :subject, class_name: 'FHIR::Reference'    
    embeds_one :diseaseSymptomProcedure, class_name: 'FHIR::CodeableConcept'    
    embeds_one :diseaseStatus, class_name: 'FHIR::CodeableConcept'    
    embeds_many :comorbidity, class_name: 'FHIR::CodeableConcept'    
    embeds_one :intendedEffect, class_name: 'FHIR::CodeableConcept'    
    embeds_one :duration, class_name: 'FHIR::Quantity'    
    embeds_many :otherTherapy, class_name: 'FHIR::MedicinalProductIndicationOtherTherapy'    
    embeds_many :undesirableEffect, class_name: 'FHIR::Reference'    
    embeds_many :population, class_name: 'FHIR::Population'    

    def self.transform_json(json_hash, target = MedicinalProductIndication.new)
      result = self.superclass.transform_json(json_hash, target)
      result['subject'] = json_hash['subject'].map { |var| Reference.transform_json(var) } unless json_hash['subject'].nil?
      result['diseaseSymptomProcedure'] = CodeableConcept.transform_json(json_hash['diseaseSymptomProcedure']) unless json_hash['diseaseSymptomProcedure'].nil?
      result['diseaseStatus'] = CodeableConcept.transform_json(json_hash['diseaseStatus']) unless json_hash['diseaseStatus'].nil?
      result['comorbidity'] = json_hash['comorbidity'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['comorbidity'].nil?
      result['intendedEffect'] = CodeableConcept.transform_json(json_hash['intendedEffect']) unless json_hash['intendedEffect'].nil?
      result['duration'] = Quantity.transform_json(json_hash['duration']) unless json_hash['duration'].nil?
      result['otherTherapy'] = json_hash['otherTherapy'].map { |var| MedicinalProductIndicationOtherTherapy.transform_json(var) } unless json_hash['otherTherapy'].nil?
      result['undesirableEffect'] = json_hash['undesirableEffect'].map { |var| Reference.transform_json(var) } unless json_hash['undesirableEffect'].nil?
      result['population'] = json_hash['population'].map { |var| Population.transform_json(var) } unless json_hash['population'].nil?

      result
    end
  end
end
