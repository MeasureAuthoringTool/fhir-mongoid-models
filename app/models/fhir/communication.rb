module FHIR
  # fhir/communication.rb
  class Communication < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'Communication'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :instantiatesCanonical, class_name: 'PrimitiveCanonical'
    embeds_many :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_many :inResponseTo, class_name: 'Reference'
    embeds_one :status, class_name: 'CommunicationStatus'
    embeds_one :statusReason, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :priority, class_name: 'CommunicationPriority'
    embeds_many :medium, class_name: 'CodeableConcept'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :topic, class_name: 'CodeableConcept'
    embeds_many :about, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :sent, class_name: 'PrimitiveDateTime'
    embeds_one :received, class_name: 'PrimitiveDateTime'
    embeds_many :recipient, class_name: 'Reference'
    embeds_one :sender, class_name: 'Reference'
    embeds_many :reasonCode, class_name: 'CodeableConcept'
    embeds_many :reasonReference, class_name: 'Reference'
    embeds_many :payload, class_name: 'CommunicationPayload'
    embeds_many :note, class_name: 'Annotation'

    def self.transform_json(json_hash)
      result = Communication.new
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
      result['inResponseTo'] = json_hash['inResponseTo'].map { |var| Reference.transform_json(var) } unless json_hash['inResponseTo'].nil?
      result['status'] = CommunicationStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusReason'] = CodeableConcept.transform_json(json_hash['statusReason']) unless json_hash['statusReason'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['priority'] = CommunicationPriority.transform_json(json_hash['priority']) unless json_hash['priority'].nil?      
      result['medium'] = json_hash['medium'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['medium'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['topic'] = CodeableConcept.transform_json(json_hash['topic']) unless json_hash['topic'].nil?      
      result['about'] = json_hash['about'].map { |var| Reference.transform_json(var) } unless json_hash['about'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['sent'] = PrimitiveDateTime.transform_json(json_hash['sent'], json_hash['_sent']) unless json_hash['sent'].nil?      
      result['received'] = PrimitiveDateTime.transform_json(json_hash['received'], json_hash['_received']) unless json_hash['received'].nil?      
      result['recipient'] = json_hash['recipient'].map { |var| Reference.transform_json(var) } unless json_hash['recipient'].nil?
      result['sender'] = Reference.transform_json(json_hash['sender']) unless json_hash['sender'].nil?      
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['payload'] = json_hash['payload'].map { |var| CommunicationPayload.transform_json(var) } unless json_hash['payload'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
