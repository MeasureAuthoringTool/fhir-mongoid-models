module FHIR
  # fhir/task.rb
  class Task < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Task'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :instantiatesCanonical, class_name: 'PrimitiveCanonical'
    embeds_one :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_one :groupIdentifier, class_name: 'Identifier'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'TaskStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_one :businessStatus, class_name: 'CodeableConcept'
    embeds_one :intent, class_name: 'TaskIntent'
    embeds_one :priority, class_name: 'TaskPriority'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :focus, class_name: 'Reference'
    embeds_one :for, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :executionPeriod, class_name: 'Period'
    embeds_one :authoredOn, class_name: 'PrimitiveDateTime'
    embeds_one :lastModified, class_name: 'PrimitiveDateTime'
    embeds_one :requester, class_name: 'Reference'
    embeds_many :performerType, class_name: 'CodeableConcept'
    embeds_one :owner, class_name: 'Reference'
    embeds_one :location, class_name: 'Reference'
    embeds_one :reasonCode, class_name: 'CodeableConcept'
    embeds_one :reasonReference, class_name: 'Reference'
    embeds_many :insurance, class_name: 'Reference'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :relevantHistory, class_name: 'Reference'
    embeds_one :restriction, class_name: 'TaskRestriction'
    embeds_many :input, class_name: 'TaskInput'
    embeds_many :output, class_name: 'TaskOutput'

    def self.transform_json(json_hash)
      result = Task.new
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['instantiatesCanonical'] = PrimitiveCanonical.transform_json(json_hash['instantiatesCanonical'], json_hash['_instantiatesCanonical']) unless json_hash['instantiatesCanonical'].nil?      
      result['instantiatesUri'] = PrimitiveUri.transform_json(json_hash['instantiatesUri'], json_hash['_instantiatesUri']) unless json_hash['instantiatesUri'].nil?      
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['groupIdentifier'] = Identifier.transform_json(json_hash['groupIdentifier']) unless json_hash['groupIdentifier'].nil?      
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = TaskStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?      
      result['businessStatus'] = CodeableConcept.transform_json(json_hash['businessStatus']) unless json_hash['businessStatus'].nil?      
      result['intent'] = TaskIntent.transform_json(json_hash['intent']) unless json_hash['intent'].nil?      
      result['priority'] = TaskPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['focus'] = Reference.transform_json(json_hash['focus']) unless json_hash['focus'].nil?      
      result['for'] = Reference.transform_json(json_hash['for']) unless json_hash['for'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['executionPeriod'] = Period.transform_json(json_hash['executionPeriod']) unless json_hash['executionPeriod'].nil?      
      result['authoredOn'] = PrimitiveDateTime.transform_json(json_hash['authoredOn'], json_hash['_authoredOn']) unless json_hash['authoredOn'].nil?      
      result['lastModified'] = PrimitiveDateTime.transform_json(json_hash['lastModified'], json_hash['_lastModified']) unless json_hash['lastModified'].nil?      
      result['requester'] = Reference.transform_json(json_hash['requester']) unless json_hash['requester'].nil?      
      result['performerType'] = json_hash['performerType'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['performerType'].nil?
      result['owner'] = Reference.transform_json(json_hash['owner']) unless json_hash['owner'].nil?      
      result['location'] = Reference.transform_json(json_hash['location']) unless json_hash['location'].nil?      
      result['reasonCode'] = CodeableConcept.transform_json(json_hash['reasonCode']) unless json_hash['reasonCode'].nil?      
      result['reasonReference'] = Reference.transform_json(json_hash['reasonReference']) unless json_hash['reasonReference'].nil?      
      result['insurance'] = json_hash['insurance'].map { |var| Reference.transform_json(var) } unless json_hash['insurance'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['relevantHistory'] = json_hash['relevantHistory'].map { |var| Reference.transform_json(var) } unless json_hash['relevantHistory'].nil?
      result['restriction'] = TaskRestriction.transform_json(json_hash['restriction']) unless json_hash['restriction'].nil?      
      result['input'] = json_hash['input'].map { |var| TaskInput.transform_json(var) } unless json_hash['input'].nil?
      result['output'] = json_hash['output'].map { |var| TaskOutput.transform_json(var) } unless json_hash['output'].nil?

      result
    end
  end
end
