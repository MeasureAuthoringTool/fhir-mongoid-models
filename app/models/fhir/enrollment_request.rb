module FHIR
  # fhir/enrollment_request.rb
  class EnrollmentRequest < DomainResource
    include Mongoid::Document
    embeds_many :identifier, class_name: 'FHIR::Identifier'
    embeds_one :status, class_name: 'FHIR::EnrollmentRequestStatus'
    embeds_one :created, class_name: 'FHIR::PrimitiveDateTime'
    embeds_one :insurer, class_name: 'FHIR::Reference'
    embeds_one :provider, class_name: 'FHIR::Reference'
    embeds_one :candidate, class_name: 'FHIR::Reference'
    embeds_one :coverage, class_name: 'FHIR::Reference'

    def self.transform_json(json_hash, target = EnrollmentRequest.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = json_hash['identifier'].map { |var| Identifier.transform_json(var) } unless json_hash['identifier'].nil?
      result['status'] = EnrollmentRequestStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['created'] = PrimitiveDateTime.transform_json(json_hash['created'], json_hash['_created']) unless json_hash['created'].nil?      
      result['insurer'] = Reference.transform_json(json_hash['insurer']) unless json_hash['insurer'].nil?      
      result['provider'] = Reference.transform_json(json_hash['provider']) unless json_hash['provider'].nil?      
      result['candidate'] = Reference.transform_json(json_hash['candidate']) unless json_hash['candidate'].nil?      
      result['coverage'] = Reference.transform_json(json_hash['coverage']) unless json_hash['coverage'].nil?      

      result
    end
  end
end
