module FHIR
  # fhir/consent.rb
  class Consent < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'ConsentState'
    embeds_one :scope, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :dateTime, class_name: 'PrimitiveDateTime'
    embeds_many :performer, class_name: 'Reference'
    embeds_many :organization, class_name: 'Reference'
    embeds_one :sourceAttachment, class_name: 'Attachment'
    embeds_one :sourceReference, class_name: 'Reference'
    embeds_many :policy, class_name: 'ConsentPolicy'
    embeds_one :policyRule, class_name: 'CodeableConcept'
    embeds_many :verification, class_name: 'ConsentVerification'
    embeds_one :provision, class_name: 'ConsentProvision'

    def self.transform_json(json_hash, target = Consent.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = ConsentState.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['scope'] = CodeableConcept.transform_json(json_hash['scope']) unless json_hash['scope'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['dateTime'] = PrimitiveDateTime.transform_json(json_hash['dateTime'], json_hash['_dateTime']) unless json_hash['dateTime'].nil?      
      result['performer'] = json_hash['performer'].map { |var| Reference.transform_json(var) } unless json_hash['performer'].nil?
      result['organization'] = json_hash['organization'].map { |var| Reference.transform_json(var) } unless json_hash['organization'].nil?
      result['sourceAttachment'] = Attachment.transform_json(json_hash['sourceAttachment']) unless json_hash['sourceAttachment'].nil?      
      result['sourceReference'] = Reference.transform_json(json_hash['sourceReference']) unless json_hash['sourceReference'].nil?      
      result['policy'] = json_hash['policy'].map { |var| ConsentPolicy.transform_json(var) } unless json_hash['policy'].nil?
      result['policyRule'] = CodeableConcept.transform_json(json_hash['policyRule']) unless json_hash['policyRule'].nil?      
      result['verification'] = json_hash['verification'].map { |var| ConsentVerification.transform_json(var) } unless json_hash['verification'].nil?
      result['provision'] = ConsentProvision.transform_json(json_hash['provision']) unless json_hash['provision'].nil?      

      result
    end
  end
end
