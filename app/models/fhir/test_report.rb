module FHIR
  # fhir/test_report.rb
  class TestReport < DomainResource
    include Mongoid::Document
    embeds_one :identifier, class_name: 'FHIR::Identifier'    
    embeds_one :name, class_name: 'FHIR::PrimitiveString'    
    embeds_one :status, class_name: 'FHIR::TestReportStatus'    
    embeds_one :testScript, class_name: 'FHIR::Reference'    
    embeds_one :result, class_name: 'FHIR::TestReportResult'    
    embeds_one :score, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :tester, class_name: 'FHIR::PrimitiveString'    
    embeds_one :issued, class_name: 'FHIR::PrimitiveDateTime'    
    embeds_many :participant, class_name: 'FHIR::TestReportParticipant'    
    embeds_one :setup, class_name: 'FHIR::TestReportSetup'    
    embeds_many :test, class_name: 'FHIR::TestReportTest'    
    embeds_one :teardown, class_name: 'FHIR::TestReportTeardown'    
    
    def as_json(*args)
      result = super      
      unless self.identifier.nil? 
        result['identifier'] = self.identifier.as_json(*args)
      end
      unless self.name.nil? 
        result['name'] = self.name.value
        serialized = Extension.serializePrimitiveExtension(self.name)            
        result['_name'] = serialized unless serialized.nil?
      end
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
      end
      unless self.testScript.nil? 
        result['testScript'] = self.testScript.as_json(*args)
      end
      unless self.result.nil? 
        result['result'] = self.result.value
        serialized = Extension.serializePrimitiveExtension(self.result)            
        result['_result'] = serialized unless serialized.nil?
      end
      unless self.score.nil? 
        result['score'] = self.score.value
        serialized = Extension.serializePrimitiveExtension(self.score)            
        result['_score'] = serialized unless serialized.nil?
      end
      unless self.tester.nil? 
        result['tester'] = self.tester.value
        serialized = Extension.serializePrimitiveExtension(self.tester)            
        result['_tester'] = serialized unless serialized.nil?
      end
      unless self.issued.nil? 
        result['issued'] = self.issued.value
        serialized = Extension.serializePrimitiveExtension(self.issued)            
        result['_issued'] = serialized unless serialized.nil?
      end
      unless self.participant.nil?  || !self.participant.any? 
        result['participant'] = self.participant.map{ |x| x.as_json(*args) }
      end
      unless self.setup.nil? 
        result['setup'] = self.setup.as_json(*args)
      end
      unless self.test.nil?  || !self.test.any? 
        result['test'] = self.test.map{ |x| x.as_json(*args) }
      end
      unless self.teardown.nil? 
        result['teardown'] = self.teardown.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = TestReport.new)
      result = self.superclass.transform_json(json_hash, target)
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?
      result['status'] = TestReportStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['testScript'] = Reference.transform_json(json_hash['testScript']) unless json_hash['testScript'].nil?
      result['result'] = TestReportResult.transform_json(json_hash['result'], json_hash['_result']) unless json_hash['result'].nil?
      result['score'] = PrimitiveDecimal.transform_json(json_hash['score'], json_hash['_score']) unless json_hash['score'].nil?
      result['tester'] = PrimitiveString.transform_json(json_hash['tester'], json_hash['_tester']) unless json_hash['tester'].nil?
      result['issued'] = PrimitiveDateTime.transform_json(json_hash['issued'], json_hash['_issued']) unless json_hash['issued'].nil?
      result['participant'] = json_hash['participant'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          TestReportParticipant.transform_json(var) 
        end
      } unless json_hash['participant'].nil?
      result['setup'] = TestReportSetup.transform_json(json_hash['setup']) unless json_hash['setup'].nil?
      result['test'] = json_hash['test'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          TestReportTest.transform_json(var) 
        end
      } unless json_hash['test'].nil?
      result['teardown'] = TestReportTeardown.transform_json(json_hash['teardown']) unless json_hash['teardown'].nil?

      result
    end
  end
end
