class Owner

  @@all = []

  attr_reader :name, :species

  def initialize(name=nil)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end
###################################################################################
#Association methods below

def cats
  Cat.all.select { |cat_instance|
    cat_instance.owner == self
  }
end

def dogs
  Dog.all.select { |dog_instance|
    dog_instance.owner == self
  }
end

def buy_cat(cat_name)
  Cat.new(cat_name, self)
end

def buy_dog(dog_name)
  Dog.new(dog_name, self)
end

def walk_dogs
  change_moods(dogs, 'happy')
end

def feed_cats
  change_moods(cats, 'happy')
end

def sell_pets
  change_moods(cats, 'nervous')
  change_moods(dogs, 'nervous')
  remove_owner(cats)
  remove_owner(dogs)
end

def list_pets
  "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
end

def change_moods(obj_arr, new_mood)  #Custom method not in assignment, makes methods DRYer
  obj_arr.each { |obj|
    obj.mood = new_mood
  }
end

def remove_owner(obj_arr) #Custom method not in assignment, makes methods DRYer
  obj_arr.each { |obj|
    obj.owner = nil
  }
end
###################################################################################
#Class methods below


  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end


end