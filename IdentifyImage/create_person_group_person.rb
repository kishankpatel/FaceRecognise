require 'net/http'
require 'json'

class PersonGroupPerson
  
  def create(person_group_id, person_name)
    uri = URI("https://westcentralus.api.cognitive.microsoft.com/face/v1.0/persongroups/#{person_group_id}/persons")

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = 'ab861cc3228a4d67b75f724f404166a3'
    # Request body
    request.body = " { \"name\": \"#{person_name}\" } "

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end

    response_body = JSON.parse response.body
    response_body["personId"]
  end
   
end