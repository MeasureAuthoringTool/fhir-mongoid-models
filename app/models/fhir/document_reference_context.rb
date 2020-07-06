module FHIR
  # fhir/document_reference_context.rb
  class DocumentReferenceContext < BackboneElement
    include Mongoid::Document
    embeds_many :encounter, class_name: 'Reference'
    embeds_many :event, class_name: 'CodeableConcept'
    embeds_one :period, class_name: 'Period'
    embeds_one :facilityType, class_name: 'CodeableConcept'
    embeds_one :practiceSetting, class_name: 'CodeableConcept'
    embeds_one :sourcePatientInfo, class_name: 'Reference'
    embeds_many :related, class_name: 'Reference'

    def self.transform_json(json_hash, target = DocumentReferenceContext.new)
      result = self.superclass.transform_json(json_hash, target)
      result['encounter'] = json_hash['encounter'].map { |var| Reference.transform_json(var) } unless json_hash['encounter'].nil?
      result['event'] = json_hash['event'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['event'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['facilityType'] = CodeableConcept.transform_json(json_hash['facilityType']) unless json_hash['facilityType'].nil?      
      result['practiceSetting'] = CodeableConcept.transform_json(json_hash['practiceSetting']) unless json_hash['practiceSetting'].nil?      
      result['sourcePatientInfo'] = Reference.transform_json(json_hash['sourcePatientInfo']) unless json_hash['sourcePatientInfo'].nil?      
      result['related'] = json_hash['related'].map { |var| Reference.transform_json(var) } unless json_hash['related'].nil?

      result
    end
  end
end
