require 'net/http'
class PersonGroup
  @person_group_id = ""
  
  def initialize(person_group_id)
    @person_group_id = person_group_id
  end

  def create
    uri = URI("https://westcentralus.api.cognitive.microsoft.com/face/v1.0/persongroups/#{@person_group_id}")

    request = Net::HTTP::Put.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = 'ab861cc3228a4d67b75f724f404166a3'
    # Request body
    request.body = " { \"name\": \"group1\" } "

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    @person_group_id
  end
end