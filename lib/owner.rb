# require "pry"

class Owner

  #getter method
  attr_reader :name, :species

  @@all = []

  #initialize owner with name and species when instance is created
  def initialize(name)

    #instance variables
    @name = name
    @species = "human"
    
    #class variable
    @@all << self
    
  end

  def cats
    #return a collection of all cats that belong to the owner
    Cat.all.select do |cat_instance|
      cat_instance.owner == self
    end
  end

  def dogs
    #return a collection of all dogs that belong to the owner
    Dog.all.select do |dog_instance|
      dog_instance.owner == self
    end
  end

  def buy_cat(cat_name)
    #create new Cat instance with cat's name
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    #create new Cat instance with cat's name
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    cats.each do |cat|
      cat.mood = "nervous"
      cat.remove_owner
    end

    dogs.each do |dog|
      dog.mood = "nervous"
      dog.remove_owner
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def say_species #instance method
    "I am a human."
  end

  def self.all #class method
    @@all
  end

  def self.count #class method
    Owner.all.length
  end

  def self.reset_all #class method
    Owner.all.clear
  end


end #end of Owner class

# owner = Owner.new("Harry")

# owner.buy_dog("Snuffles")
# owner.buy_dog("Fido")
# owner.buy_dog("Rover")

# owner.buy_cat("Crookshanks")
# owner.buy_cat("Whiskers")
# owner.buy_cat("Garfield")

# owner.walk_dogs

# binding.pry



