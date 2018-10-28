require 'net/http'
require 'json'
class Identify

  def identify_faces(face_ids)
    uri = URI('https://westcentralus.api.cognitive.microsoft.com/face/v1.0/identify')
    uri.query = URI.encode_www_form({
    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = 'ab861cc3228a4d67b75f724f404166a3'
    # Request body
    request.body = " { \"personGroupId\": \"person-group-id-1\", \"faceIds\": #{face_ids} } "

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    response.body
  end
end


# matched: [{"faceId":"93eb2e60-d18d-47ee-8a19-091eecf71c19","candidates":[{"personId":"c08b6005-36fe-4b81-9cd4-6c208aa86987","confidence":0.74147}]},{"faceId":"7874b13d-d916-4b31-897f-6a3bdee8e203","candidates":[{"personId":"c08b6005-36fe-4b81-9cd4-6c208aa86987","confidence":0.73401}]}]
# not matched: [{"faceId":"1e271e5f-5a28-41b4-880c-e3760d0e8720","candidates":[]}]
