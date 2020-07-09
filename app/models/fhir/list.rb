module FHIR
  # fhir/list.rb
  class List < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::ListStatus'
    embeds_one :mode, class_name: 'FHIR::ListMode'
    embeds_one :title, class_name: 'FHIR::PrimitiveString'
    embeds_one :code, class_name: 'FHIR::CodeableConcept'
    embeds_one :subject, class_name: 'FHIR::Reference'
    embeds_one :encounter, class_name: 'FHIR::Reference'
    embeds_one :date, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :source, class_name: 'FHIR::Reference'
    embeds_one :orderedBy, class_name: 'FHIR::CodeableConcept'
    embeds_many :note, class_name: 'FHIR::Annotation'
    embeds_many :entry, class_name: 'FHIR::ListEntry'
    embeds_one :emptyReason, class_name: 'FHIR::CodeableConcept'

    def self.transform_json(json_hash, target = List.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ListStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['mode'] = ListMode.transform_json(json_hash['mode']) unless json_hash['mode'].nil?      
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['date'] = PrimitiveDateTime.transform_json(json_hash['date'], json_hash['_date']) unless json_hash['date'].nil?      
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?      
      result['orderedBy'] = CodeableConcept.transform_json(json_hash['orderedBy']) unless json_hash['orderedBy'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['entry'] = json_hash['entry'].map { |var| ListEntry.transform_json(var) } unless json_hash['entry'].nil?
      result['emptyReason'] = CodeableConcept.transform_json(json_hash['emptyReason']) unless json_hash['emptyReason'].nil?      

      result
    end
  end
end
