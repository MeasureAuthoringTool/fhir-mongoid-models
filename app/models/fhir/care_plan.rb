module FHIR
  # fhir/care_plan.rb
  class CarePlan < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'CarePlan'
    embeds_many :identifier, class_name: 'Identifier'
    embeds_many :instantiatesCanonical, class_name: 'PrimitiveCanonical'
    embeds_many :instantiatesUri, class_name: 'PrimitiveUri'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :replaces, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :status, class_name: 'CarePlanStatus'
    embeds_one :intent, class_name: 'CarePlanIntent'
    embeds_many :category, class_name: 'CodeableConcept'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :period, class_name: 'Period'
    embeds_one :created, class_name: 'PrimitiveDateTime'
    embeds_one :author, class_name: 'Reference'
    embeds_many :contributor, class_name: 'Reference'
    embeds_many :careTeam, class_name: 'Reference'
    embeds_many :addresses, class_name: 'Reference'
    embeds_many :supportingInfo, class_name: 'Reference'
    embeds_many :goal, class_name: 'Reference'
    embeds_many :activity, class_name: 'CarePlanActivity'
    embeds_many :note, class_name: 'Annotation'

    def self.transform_json(json_hash)
      result = CarePlan.new
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
      result['replaces'] = json_hash['replaces'].map { |var| Reference.transform_json(var) } unless json_hash['replaces'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['status'] = CarePlanStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['intent'] = CarePlanIntent.transform_json(json_hash['intent']) unless json_hash['intent'].nil?      
      result['category'] = json_hash['category'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['category'].nil?
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?      
      result['contributor'] = json_hash['contributor'].map { |var| Reference.transform_json(var) } unless json_hash['contributor'].nil?
      result['careTeam'] = json_hash['careTeam'].map { |var| Reference.transform_json(var) } unless json_hash['careTeam'].nil?
      result['addresses'] = json_hash['addresses'].map { |var| Reference.transform_json(var) } unless json_hash['addresses'].nil?
      result['supportingInfo'] = json_hash['supportingInfo'].map { |var| Reference.transform_json(var) } unless json_hash['supportingInfo'].nil?
      result['goal'] = json_hash['goal'].map { |var| Reference.transform_json(var) } unless json_hash['goal'].nil?
      result['activity'] = json_hash['activity'].map { |var| CarePlanActivity.transform_json(var) } unless json_hash['activity'].nil?
      result['note'] = json_hash['note'].map { |var| Annotation.transform_json(var) } unless json_hash['note'].nil?

      result
    end
  end
end
