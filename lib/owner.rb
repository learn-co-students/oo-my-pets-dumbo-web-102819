class Owner
  @@all = []
  attr_reader :name, :species 

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end 

  def say_species 
    "I am a #{@species}."
  end 
  
  def self.all 
    @@all
  end 
  
  def self.count
    @@all.count
  end 

  def self.reset_all
    @@all.clear
  end 

  def cats
    Cat.all.select do |instance|
      self == instance.owner 
    end 
  end 

  def dogs
    Dog.all.select do |instance|
      self == instance.owner
    end 
  end 

  # def pets 
  #   new_array = []
  #   self.cats.each do |instance|
  #     new_array << instance
  #   end 
  #   self.dogs.each do |instance|
  #     new_array << instance 
  #   end 
  # end 

  def buy_cat(cat_name)
    @@all << Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    @@all << Dog.new(dog_name, self)
  end 

  def walk_dogs
    self.dogs.each do |instance|
      instance.mood = "happy"
    end 
  end 

  def feed_cats
    self.cats.each do |instance|
      instance.mood = "happy"
    end 
  end 

  def sell_pets
    # self.pets.each do |instance|
    #   instance.owner = nil
    #   instance.mood = "nervous"
    # end 
    self.cats.each do |instance|
      instance.owner = nil  
      instance.mood = "nervous"
    end 
    self.dogs.each do |instance|
      instance.owner = nil
      instance.mood = "nervous"
    end
  end 
  
  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 

end