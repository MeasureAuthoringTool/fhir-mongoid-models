module FHIR
  # fhir/episode_of_care.rb
  class EpisodeOfCare < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :status, class_name: 'EpisodeOfCareStatus'
    embeds_many :statusHistory, class_name: 'EpisodeOfCareStatusHistory'
    embeds_many :type, class_name: 'CodeableConcept'
    embeds_many :diagnosis, class_name: 'EpisodeOfCareDiagnosis'
    embeds_one :patient, class_name: 'Reference'
    embeds_one :managingOrganization, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_many :referralRequest, class_name: 'Reference'
    embeds_one :careManager, class_name: 'Reference'
    embeds_many :team, class_name: 'Reference'
    embeds_many :account, class_name: 'Reference'

    def self.transform_json(json_hash, target = EpisodeOfCare.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EpisodeOfCareStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['statusHistory'] = json_hash['statusHistory'].map { |var| EpisodeOfCareStatusHistory.transform_json(var) } unless json_hash['statusHistory'].nil?
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['diagnosis'] = json_hash['diagnosis'].map { |var| EpisodeOfCareDiagnosis.transform_json(var) } unless json_hash['diagnosis'].nil?
      result['patient'] = Reference.transform_json(json_hash['patient']) unless json_hash['patient'].nil?      
      result['managingOrganization'] = Reference.transform_json(json_hash['managingOrganization']) unless json_hash['managingOrganization'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['referralRequest'] = json_hash['referralRequest'].map { |var| Reference.transform_json(var) } unless json_hash['referralRequest'].nil?
      result['careManager'] = Reference.transform_json(json_hash['careManager']) unless json_hash['careManager'].nil?      
      result['team'] = json_hash['team'].map { |var| Reference.transform_json(var) } unless json_hash['team'].nil?
      result['account'] = json_hash['account'].map { |var| Reference.transform_json(var) } unless json_hash['account'].nil?

      result
    end
  end
end
