module FHIR
  # fhir/medication.rb
  class Medication < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :status, class_name: 'FHIR::MedicationStatus'    
    embeds_one :manufacturer, class_name: 'FHIR::Reference'    
    embeds_one :form, class_name: 'FHIR::CodeableConcept'    
    embeds_one :amount, class_name: 'FHIR::Ratio'    
    embeds_many :ingredient, class_name: 'FHIR::MedicationIngredient'    
    embeds_one :batch, class_name: 'FHIR::MedicationBatch'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil?  || !self.identifier.any? 
        result['identifier'] = self.identifier.map{ |x| x.as_json(*args) }
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.manufacturer.nil? 
        result['manufacturer'] = self.manufacturer.as_json(*args)
      end
      unless self.form.nil? 
        result['form'] = self.form.as_json(*args)
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      unless self.ingredient.nil?  || !self.ingredient.any? 
        result['ingredient'] = self.ingredient.map{ |x| x.as_json(*args) }
      end
      unless self.batch.nil? 
        result['batch'] = self.batch.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = Medication.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['status'] = MedicationStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['manufacturer'] = Reference.transform_json(json_hash['manufacturer']) unless json_hash['manufacturer'].nil?
      result['form'] = CodeableConcept.transform_json(json_hash['form']) unless json_hash['form'].nil?
      result['amount'] = Ratio.transform_json(json_hash['amount']) unless json_hash['amount'].nil?
      result['ingredient'] = json_hash['ingredient'].map { |var| MedicationIngredient.transform_json(var) } unless json_hash['ingredient'].nil?
      result['batch'] = MedicationBatch.transform_json(json_hash['batch']) unless json_hash['batch'].nil?

      result
    end
  end
end
