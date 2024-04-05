class Member
  attr_reader :id,
              :name,
              :photo_path,
              :allies,
              :enemies,
              :affiliation

  def initialize(data)
    @id = data[:_id]
    @name = data[:name]
    @photo_path = data[:photoUrl]
    @allies = data[:allies]
    @enemies = data[:enemies].reject(&:empty?)
    @affiliation = data[:affiliation]
  end
end