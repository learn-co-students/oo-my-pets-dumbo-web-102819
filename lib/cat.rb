class Cat
  
  #getter method
  attr_reader :name

  #getter and setter method
  attr_accessor :owner, :mood

  @@all = []

  def initialize(cat_name, owner)
    @name = cat_name
    @owner = owner
    @mood = "nervous"

    @@all << self
  end

  def self.all
    @@all
  end

  def remove_owner
    remove_instance_variable(:@owner)
  end

end

