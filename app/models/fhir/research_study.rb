module FHIR
  # fhir/research_study.rb
  class ResearchStudy < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'Identifier'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_many :protocol, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'ResearchStudyStatus'
    embeds_one :primaryPurposeType, class_name: 'CodeableConcept'
    embeds_one :phase, class_name: 'CodeableConcept'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_many :focus, class_name: 'CodeableConcept'
    embeds_many :condition, class_name: 'CodeableConcept'
    embeds_many :contact, class_name: 'ContactDetail'
    embeds_many :relatedArtifact, class_name: 'RelatedArtifact'
    embeds_many :keyword, class_name: 'CodeableConcept'
    embeds_many :location, class_name: 'CodeableConcept'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :enrollment, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_one :sponsor, class_name: 'Reference'
    embeds_one :principalInvestigator, class_name: 'Reference'
    embeds_many :site, class_name: 'Reference'
    embeds_one :reasonStopped, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :arm, class_name: 'ResearchStudyArm'
    embeds_many :objective, class_name: 'ResearchStudyObjective'

    def self.transform_json(json_hash, target = ResearchStudy.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['protocol'] = json_hash['protocol'].map { |var| Reference.transform_json(var) } unless json_hash['protocol'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = ResearchStudyStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['primaryPurposeType'] = CodeableConcept.transform_json(json_hash['primaryPurposeType']) unless json_hash['primaryPurposeType'].nil?      
      result['phase'] = CodeableConcept.transform_json(json_hash['phase']) unless json_hash['phase'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['focus'] = json_hash['focus'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['focus'].nil?
      result['condition'] = json_hash['condition'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['condition'].nil?
      result['contact'] = json_hash['contact'].map { |var| ContactDetail.transform_json(var) } unless json_hash['contact'].nil?
      result['relatedArtifact'] = json_hash['relatedArtifact'].map { |var| RelatedArtifact.transform_json(var) } unless json_hash['relatedArtifact'].nil?
      result['keyword'] = json_hash['keyword'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['keyword'].nil?
      result['location'] = json_hash['location'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['location'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['enrollment'] = json_hash['enrollment'].map { |var| Reference.transform_json(var) } unless json_hash['enrollment'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['sponsor'] = Reference.transform_json(json_hash['sponsor']) unless json_hash['sponsor'].nil?      
      result['principalInvestigator'] = Reference.transform_json(json_hash['principalInvestigator']) unless json_hash['principalInvestigator'].nil?      
      result['site'] = json_hash['site'].map { |var| Reference.transform_json(var) } unless json_hash['site'].nil?
      result['reasonStopped'] = CodeableConcept.transform_json(json_hash['reasonStopped']) unless json_hash['reasonStopped'].nil?      
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?
      result['arm'] = json_hash['arm'].map { |var| ResearchStudyArm.transform_json(var) } unless json_hash['arm'].nil?
      result['objective'] = json_hash['objective'].map { |var| ResearchStudyObjective.transform_json(var) } unless json_hash['objective'].nil?

      result
    end
  end
end
