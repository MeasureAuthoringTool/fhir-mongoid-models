module FHIR
  # fhir/diagnostic_report_media.rb
  class DiagnosticReportMedia < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'DiagnosticReportMedia'
    embeds_one :comment, class_name: 'PrimitiveString'
    embeds_one :link, class_name: 'Reference'

    def self.transform_json(json_hash)
      result = DiagnosticReportMedia.new
      result['comment'] = PrimitiveString.transform_json(json_hash['comment'], json_hash['_comment']) unless json_hash['comment'].nil?      
      result['link'] = Reference.transform_json(json_hash['link']) unless json_hash['link'].nil?      

      result
    end
  end
end
