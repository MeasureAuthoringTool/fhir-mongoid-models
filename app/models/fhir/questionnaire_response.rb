module FHIR
  # fhir/questionnaire_response.rb
  class QuestionnaireResponse < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'QuestionnaireResponse'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_many :basedOn, class_name: 'Reference'
    embeds_many :partOf, class_name: 'Reference'
    embeds_one :questionnaire, class_name: 'PrimitiveCanonical'
    embeds_one :status, class_name: 'QuestionnaireResponseStatus'
    embeds_one :subject, class_name: 'Reference'
    embeds_one :encounter, class_name: 'Reference'
    embeds_one :authored, class_name: 'PrimitiveDateTime'
    embeds_one :author, class_name: 'Reference'
    embeds_one :source, class_name: 'Reference'
    embeds_many :item, class_name: 'QuestionnaireResponseItem'

    def self.transform_json(json_hash)
      result = QuestionnaireResponse.new
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['basedOn'] = json_hash['basedOn'].map { |var| Reference.transform_json(var) } unless json_hash['basedOn'].nil?
      result['partOf'] = json_hash['partOf'].map { |var| Reference.transform_json(var) } unless json_hash['partOf'].nil?
      result['questionnaire'] = PrimitiveCanonical.transform_json(json_hash['questionnaire'], json_hash['_questionnaire']) unless json_hash['questionnaire'].nil?      
      result['status'] = QuestionnaireResponseStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['subject'] = Reference.transform_json(json_hash['subject']) unless json_hash['subject'].nil?      
      result['encounter'] = Reference.transform_json(json_hash['encounter']) unless json_hash['encounter'].nil?      
      result['authored'] = PrimitiveDateTime.transform_json(json_hash['authored'], json_hash['_authored']) unless json_hash['authored'].nil?      
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?      
      result['source'] = Reference.transform_json(json_hash['source']) unless json_hash['source'].nil?      
      result['item'] = json_hash['item'].map { |var| QuestionnaireResponseItem.transform_json(var) } unless json_hash['item'].nil?

      result
    end
  end
end
