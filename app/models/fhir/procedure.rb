module FHIR
  # fhir/procedure.rb
  class Procedure < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Procedure'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :instantiatesCanonical, class_name: 'PrimitiveCanonical'
    embeds_many :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'ProcedureStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :category, class_name: 'CodeableConcept'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :performedDateTime, class_name: 'PrimitiveDateTime'
    embeds_one :performedPeriod, class_name: 'Period'
    embeds_one :performedString, class_name: 'PrimitiveString'
    embeds_one :performedAge, class_name: 'Age'
    embeds_one :performedRange, class_name: 'Range'
    embeds_one :recorder, class_name: 'Reference'
    embeds_one :asserter, class_name: 'Reference'
    embeds_many :performer, class_name: 'ProcedurePerformer'
    embeds_one :location, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :bodySite, class_name: 'CodeableConcept'
    embeds_one :outcome, class_name: 'CodeableConcept'
    embeds_many :report, class_name: 'Reference'
    embeds_many :complication, class_name: 'CodeableConcept'
    embeds_many :complicationDetail, class_name: 'Reference'
    embeds_many :followUp, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :focalDevice, class_name: 'ProcedureFocalDevice'
    embeds_many :usedReference, class_name: 'Reference'
    embeds_many :usedCode, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=Procedure.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = json_hash['instantiatesCanonical'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesCanonical'] && json_hash['_instantiatesCanonical'][i]
        PrimitiveCanonical.transform_json(var, extension_hash)
      end unless json_hash['instantiatesCanonical'].nil?
      result['instantiatesUri'] = json_hash['instantiatesUri'].each_with_index.map do |var, i|
        extension_hash = json_hash['_instantiatesUri'] && json_hash['_instantiatesUri'][i]
        PrimitiveUri.transform_json(var, extension_hash)
      end unless json_hash['instantiatesUri'].nil?
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = ProcedureStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?      
      result['category'] = CodeableConcept.transform_json(json_hash['category']) unless json_hash['category'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['performedDateTime'] = PrimitiveDateTime.transform_json(json_hash['performedDateTime'], json_hash['_performedDateTime']) unless json_hash['performedDateTime'].nil?      
      result['performedPeriod'] = Period.transform_json(json_hash['performedPeriod']) unless json_hash['performedPeriod'].nil?      
      result['performedString'] = PrimitiveString.transform_json(json_hash['performedString'], json_hash['_performedString']) unless json_hash['performedString'].nil?      
      result['performedAge'] = Age.transform_json(json_hash['performedAge']) unless json_hash['performedAge'].nil?      
      result['performedRange'] = Range.transform_json(json_hash['performedRange']) unless json_hash['performedRange'].nil?      
      result['recorder'] = Reference.transform_json(json_hash['recorder']) unless json_hash['recorder'].nil?      
      result['asserter'] = Reference.transform_json(json_hash['asserter']) unless json_hash['asserter'].nil?      
      result['performer'] = json_hash['performer'].map { |var| ProcedurePerformer.transform_json(var) } unless json_hash['performer'].nil?
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['bodySite'] = json_hash['bodySite'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['bodySite'].nil?
      result['outcome'] = CodeableConcept.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
      result['report'] = json_hash['report'].map { |var| Reference.transform_json(var) } unless json_hash['report'].nil?
      result['complication'] = json_hash['complication'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['complication'].nil?
      result['complicationDetail'] = json_hash['complicationDetail'].map { |var| Reference.transform_json(var) } unless json_hash['complicationDetail'].nil?
      result['followUp'] = json_hash['followUp'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['followUp'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['focalDevice'] = json_hash['focalDevice'].map { |var| ProcedureFocalDevice.transform_json(var) } unless json_hash['focalDevice'].nil?
      result['usedReference'] = json_hash['usedReference'].map { |var| Reference.transform_json(var) } unless json_hash['usedReference'].nil?
      result['usedCode'] = json_hash['usedCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['usedCode'].nil?

      result
    end
  end
end
