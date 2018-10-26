require 'net/http'
require 'json'

class VerifyPerson
  
  def check_identical(op_face_ids)
    verify_uri = URI('https://westcentralus.api.cognitive.microsoft.com/face/v1.0/verify')

    verify_request = Net::HTTP::Post.new(verify_uri.request_uri)
    # Request headers
    verify_request['Content-Type'] = 'application/json'
    # Request headers
    verify_request['Ocp-Apim-Subscription-Key'] = 'ab861cc3228a4d67b75f724f404166a3'
    # Request body

    verify_request.body = "{\"faceId1\": \"#{op_face_ids.first}\", \"faceId2\": \"#{op_face_ids.last}\" }"

    response = Net::HTTP.start(verify_uri.host, verify_uri.port, :use_ssl => verify_uri.scheme == 'https') do |http|
      http.request(verify_request)
    end

    (JSON.parse response.body)
  end

end
