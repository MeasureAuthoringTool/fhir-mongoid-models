module FHIR
  # fhir/annotation.rb
  class Annotation < Element
    include Mongoid::Document
    embeds_one :authorReference, class_name: 'FHIR::Reference'
    embeds_one :authorString, class_name: 'FHIR::PrimitiveString'
    embeds_one :time, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :text, class_name: 'FHIR::PrimitiveMarkdown'

    def self.transform_json(json_hash, target = Annotation.new)
      result = self.superclass.transform_json(json_hash, target)
      result['authorReference'] = Reference.transform_json(json_hash['authorReference']) unless json_hash['authorReference'].nil?      
      result['authorString'] = PrimitiveString.transform_json(json_hash['authorString'], json_hash['_authorString']) unless json_hash['authorString'].nil?      
      result['time'] = PrimitiveDateTime.transform_json(json_hash['time'], json_hash['_time']) unless json_hash['time'].nil?      
      result['text'] = PrimitiveMarkdown.transform_json(json_hash['text'], json_hash['_text']) unless json_hash['text'].nil?      

      result
    end
  end
end
