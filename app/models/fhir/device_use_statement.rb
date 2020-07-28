module FHIR
  # fhir/device_use_statement.rb
  class DeviceUseStatement < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_many :basedOn, class_name: 'FHIR::Reference'    
    embeds_one :status, class_name: 'FHIR::DeviceUseStatementStatus'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_many :derivedFrom, class_name: 'FHIR::Reference'    
    embeds_one :timingTiming, class_name: 'FHIR::Timing'    
    embeds_one :timingPeriod, class_name: 'FHIR::Period'    
    embeds_one :timingDateTime, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :recordedOn, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_one :source, class_name: 'FHIR::Reference'    
    embeds_one :device, class_name: 'FHIR::Reference'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_one :bodySite, class_name: 'FHIR::CodeableConcept'    
    embeds_many :note, class_name: 'FHIR::Annotation'    

    def self.transform_json(json_hash, target = DeviceUseStatement.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['status'] = DeviceUseStatementStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['derivedFrom'] = json_hash['derivedFrom'].map { |var| Reference.transform_json(var) } unless json_hash['derivedFrom'].nil?
      result['timingTiming'] = Timing.transform_json(json_hash['timingTiming']) unless json_hash['timingTiming'].nil?
      result['timingPeriod'] = Period.transform_json(json_hash['timingPeriod']) unless json_hash['timingPeriod'].nil?
      result['timingDateTime'] = PrimitiveDateTime.transform_json(json_hash['timingDateTime'], json_hash['_timingDateTime']) unless json_hash['timingDateTime'].nil?
      result['recordedOn'] = PrimitiveDateTime.transform_json(json_hash['recordedOn'], json_hash['_recordedOn']) unless json_hash['recordedOn'].nil?
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?
      result['device'] = Reference.transform_json(json_hash['device']) unless json_hash['device'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['bodySite'] = CodeableConcept.transform_json(json_hash['bodySite']) unless json_hash['bodySite'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
