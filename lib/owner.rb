require "pry"


class Owner
  attr_reader :name, :species
  
  @@all = []
  
  def initialize (name)
      @name = name 
      @species = "human"
      @@all << self
  end # iniitalize
  

  def say_species
      "I am a human."
  end ## say spe

   
  def self.all
    @@all
  end #all


  def self.count
      self.all.count

  end ## count


  def self.reset_all
      self.all.clear
  end ## reset

  def cats
      Cat.all.select do |cat_instance|
        cat_instance.owner == self
        
      end ## select
  end ## cats

  def dogs
      Dog.all.select do |dog_instance|
      dog_instance.owner == self
      
    end ## select
end ## dogs

def buy_cat (new_cat_name)
    
  Cat.new(new_cat_name,self)
    
 
end ## buy_cat

def buy_dog (new_dog_name)
   Dog.new(new_dog_name,self)
    

end ## buy dog

def walk_dogs
    self.dogs.each do |dog_instance|
    dog_instance.mood = "happy"
    end ## each
end ## walk dogs


def feed_cats
  self.cats.each do |cat_instance|
    cat_instance.mood = "happy"
    end ## each

end ### feed cats


def sell_pets
    pets_total = self.dogs + self.cats
    pets_total.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
    end ## each

end ## sell_pets

def list_pets

  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  
end ## list _pets




end ## Owner