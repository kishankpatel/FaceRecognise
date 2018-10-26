require 'net/http'
require 'json'
class DetectPerson
  @ip_image_urls = []
  def initialize(ip_image_urls)
    @ip_image_urls = ip_image_urls
  end

  def get_face_ids
    
    detect_uri = URI('https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect')
    detect_uri.query = URI.encode_www_form({
      # Request parameters
      'returnFaceId' => 'true',
      'returnFaceLandmarks' => 'false'
    })

    detect_request = Net::HTTP::Post.new(detect_uri.request_uri)
    # Request headers
    detect_request['Content-Type'] = 'application/json'
    # Request headers
    detect_request['Ocp-Apim-Subscription-Key'] = 'ab861cc3228a4d67b75f724f404166a3'
    # Request body


    op_face_ids = []
    @ip_image_urls.each do |image|
      detect_request.body = "{\"url\": \"#{image} \"}"

      response = Net::HTTP.start(detect_uri.host, detect_uri.port, :use_ssl => detect_uri.scheme == 'https') do |http|
        http.request(detect_request)
      end
      op_face_ids <<  (JSON.parse response.body).first['faceId']
      
    end

    op_face_ids
  end

end