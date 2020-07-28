module FHIR
  # fhir/care_team.rb
  class CareTeam < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :status, class_name: 'FHIR::CareTeamStatus'    
    embeds_many :category, class_name: 'FHIR::CodeableConcept'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :subject, class_name: 'FHIR::Reference'    
    embeds_one :encounter, class_name: 'FHIR::Reference'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_many :participant, class_name: 'FHIR::CareTeamParticipant'    
    embeds_many :reasonCode, class_name: 'FHIR::CodeableConcept'    
    embeds_many :reasonReference, class_name: 'FHIR::Reference'    
    embeds_many :managingOrganization, class_name: 'FHIR::Reference'    
    embeds_many :telecom, class_name: 'FHIR::ContactPoint'    
    embeds_many :note, class_name: 'FHIR::Annotation'    

    def self.transform_json(json_hash, target = CareTeam.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = CareTeamStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['participant'] = json_hash['participant'].map { |var| CareTeamParticipant.transform_json(var) } unless json_hash['participant'].nil?
      result['reasonCode'] = json_hash['reasonCode'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['reasonCode'].nil?
      result['reasonReference'] = json_hash['reasonReference'].map { |var| Reference.transform_json(var) } unless json_hash['reasonReference'].nil?
      result['managingOrganization'] = json_hash['managingOrganization'].map { |var| Reference.transform_json(var) } unless json_hash['managingOrganization'].nil?
      result['telecom'] = json_hash['telecom'].map { |var| ContactPoint.transform_json(var) } unless json_hash['telecom'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
