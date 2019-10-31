class Owner
  # code goes here
  attr_reader :name, :species
  @@owners = []

  def initialize(name)
  	@name = name
  	@species = "human"
  	@@owners << self
  end

  def say_species
  	"I am a #{@species}."
  end

  def self.all
  	@@owners
  end

  def self.count
  	@@owners.length
  end

  def self.reset_all
  	@@owners = []
  end

  def cats
  	Cat.all.select do |cat|
  		#cat.owner == @name
  		#puts "Cat Owner: #{cat.owner.name}"
  		cat.owner == self
  	end
  end

  def dogs
  	Dog.all.select do |dog|
  		dog.owner == self
  	end
  end

  def buy_cat(name)
  	Cat.new(name, self)
  end

  def buy_dog(name)
  	Dog.new(name, self)
  end

  def walk_dogs
  	dogs.map do |dog|
  		dog.mood = "happy"
  	end
  end

  def feed_cats
  	cats.map do |cat|
  		cat.mood = "happy"
  	end
  end

  def sell_pets
  	pets = dogs + cats
  	pets.map do |pet|
  		pet.mood = "nervous"
  		pet.owner = nil
  	end
  end

  def list_pets
  	"I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end