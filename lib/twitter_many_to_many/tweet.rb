class Tweet 
  @@all = []

  def self.all
    @@all
  end

  attr_reader :message, :user
  def initialize(message, user)
    @message = message
    @user = user
    @@all << self
  end

  def username 
    user.username
  end

  def delete 
    Tweet.all.delete(self) 
  end

  def likes # has many of join
    Like.all.select { |like| like.tweet == self}
  end

  def likers # has_many of other, through join
    likes.map { |like| like.user}
  end

end