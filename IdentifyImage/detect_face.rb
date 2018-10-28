require 'net/http'
require 'json'
class  Detect
  def get_face_id(image_url)
    uri = URI('https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect')
    uri.query = URI.encode_www_form({
        # Request parameters
        'returnFaceId' => 'true',
        'returnFaceLandmarks' => 'false'
    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = 'ab861cc3228a4d67b75f724f404166a3'
    # Request body
    request.body = " { \"url\": \"#{image_url}\" } "

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    p response_body = JSON.parse(response.body).first
    response_body["faceId"]
  end
end
