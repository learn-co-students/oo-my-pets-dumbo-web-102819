class Owner

  def initialize (name)
    @name = name
    @species = "human"

    @@all << self
  end

  @@all = []

  def self.all
    @@all
  end

  attr_reader :name, :species
  attr_accessor
  attr_writer

  def say_species
    "I am a #{self.species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat (new_name)
    Cat.new(new_name, self)
  end

  def buy_dog (new_name)
    Dog.new(new_name, self)
  end

  def walk_dogs
    self.dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|kitty| kitty.mood = "happy"}
  end

  def sell_pets
    pet_list = self.dogs + self.cats
    #pet_list.flatten
    pet_list.map do
      |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
