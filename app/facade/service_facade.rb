class ServiceFacade
  def affiliation_members(affiliation)
    service = SearchService.new
    json = service.characters_by_affiliation(affiliation)

    json.map do |data|
      Member.new(data)
    end
  end
end