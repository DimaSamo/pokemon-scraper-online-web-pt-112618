class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(keywords)

  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten
    new_pokemon=Pokemon.new(pokemon)
    self.save(new_pokemon)
    new_pokemon.name
  end

end
