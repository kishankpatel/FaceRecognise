require 'net/http'
class TrainPersonGroup
  def train(person_group_id)
    uri = URI('https://westcentralus.api.cognitive.microsoft.com/face/v1.0/persongroups/person-group-id-1/train')
    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = 'ab861cc3228a4d67b75f724f404166a3'

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    puts response.body
  end
end