class Cat
  
  attr_reader :name
  attr_accessor :owner, :mood
  
  @@all = []
  def initialize (name, owner)
      @name = name
      @owner = owner
      @mood = "nervous"

      @@all << self
  end ##initialize

  def self.all
     @@all
  end ## all


end