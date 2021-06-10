class Like 
  @@all = []
  def self.all 
    @@all 
  end

  attr_reader :tweet, :user
  def initialize(tweet, user)
    @tweet = tweet 
    @user = user
    @@all << self
  end
end