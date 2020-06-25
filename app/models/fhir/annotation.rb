module FHIR
  # fhir/annotation.rb
  class Annotation < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Annotation'
    embeds_one :authorReference, class_name: 'Reference'
    embeds_one :authorstring, class_name: 'PrimitiveString'
    embeds_one :time, class_name: 'PrimitiveDateTime'
    embeds_one :text, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash)
      result = Annotation.new
      result['authorReference'] = Reference.transform_json(json_hash['authorReference']) unless json_hash['authorReference'].nil?      
      result['authorstring'] = PrimitiveString.transform_json(json_hash['authorstring'], json_hash['_authorstring']) unless json_hash['authorstring'].nil?      
      result['time'] = PrimitiveDateTime.transform_json(json_hash['time'], json_hash['_time']) unless json_hash['time'].nil?      
      result['text'] = PrimitiveMarkdown.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      

      result
    end
  end
end
