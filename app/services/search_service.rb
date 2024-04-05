class SearchService
  def connection
    Faraday.new(url: "https://last-airbender-api.fly.dev/api/v1")
  end

  def get_url(uri)
    response = connection.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def characters_by_affiliation(affiliation)
    get_url("characters?affiliation=#{affiliation}&perPage=110&page=1")
  end
end