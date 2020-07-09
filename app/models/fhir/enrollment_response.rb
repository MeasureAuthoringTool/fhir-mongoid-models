module FHIR
  # fhir/enrollment_response.rb
  class EnrollmentResponse < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::EnrollmentResponseStatus'
    embeds_one :request, class_name: 'FHIR::Reference'
    embeds_one :outcome, class_name: 'FHIR::RemittanceOutcome'
    embeds_one :disposition, class_name: 'FHIR::PrimitiveString'
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :organization, class_name: 'FHIR::Reference'
    embeds_one :requestProvider, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = EnrollmentResponse.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EnrollmentResponseStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['request'] = Reference.transform_json(json_hash['request']) unless json_hash['request'].nil?      
      result['outcome'] = RemittanceOutcome.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?      
      result['disposition'] = PrimitiveString.transform_json(json_hash['disposition'], json_hash['_disposition']) unless json_hash['disposition'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['organization'] = Reference.transform_json(json_hash['organization']) unless json_hash['organization'].nil?      
      result['requestProvider'] = Reference.transform_json(json_hash['requestProvider']) unless json_hash['requestProvider'].nil?      

      result
    end
  end
end
