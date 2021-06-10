RSpec.describe "Exercise - Many to Many - User <=> Tweet through likes" do 
  let(:user1) { User.new("Dakota") } 
  let(:user2) { User.new("Sandra") }
  let(:tweet1) { Tweet.new("I can show you the world", user1)}
  let(:tweet2) { Tweet.new("Shining, shimmering, splendid!", user2) }
  let(:tweet3) { Tweet.new("I look down at my phone for 1 minute and American Idol's winner is spoiled #frustrated", user2)}
  let(:like1) { Like.new(tweet1, user2) }
  let(:like2) { Like.new(tweet2, user1) }

  describe "Basics" do 
    describe "User" do 
      before(:each) do 
        User.class_variable_set("@@all", [])
      end
      describe ".all" do 
        it "returns an array containing all User objects" do 
          [user1, user2]
          expect(User.all).to include(user1, user2)
          expect(User.all).to eq(User.class_variable_get("@@all"))
        end
      end

      describe "#initialize" do 
        it "takes a username as an argument and adds the user to @@all" do 
          expect { user1 }.not_to raise_error
          expect(user1.instance_variable_get("@username")).to eq("Dakota")
          expect(User.all).to include(user1)
        end
      end
    end

    describe "Tweet" do 
      before(:each) do 
        Tweet.class_variable_set("@@all", [])
      end
      describe ".all" do 
        it "returns an array containing all Tweet objects" do 
          [tweet1, tweet2, tweet3]
          expect(Tweet.all).to include(tweet1, tweet2, tweet3)
          expect(Tweet.all).to eq(Tweet.class_variable_get("@@all"))
        end
      end

      describe "#initialize" do 
        it "takes a message and a user as arguments and adds the tweet to @@all" do 
          expect { tweet1 }.not_to raise_error
          expect(tweet1.instance_variable_get("@message")).to eq("I can show you the world")
          expect(tweet1.instance_variable_get("@user")).to eq(user1)
          expect(Tweet.all).to include(tweet1)
        end
      end
    end
  
    describe "Like" do 
      before(:each) do 
        Like.class_variable_set("@@all", [])
      end
      describe ".all" do 
        it "returns an array containing all Like objects" do 
          [like1, like2]
          expect(Like.all).to include(like1, like2)
          expect(Like.all).to eq(Like.class_variable_get("@@all"))
        end
      end

      describe "#initialize" do 
        it "takes a tweet and a user as arguments and adds the like to @@all" do 
          expect { like1 }.not_to raise_error
          expect(like1.instance_variable_get("@tweet")).to eq(tweet1)
          expect(like1.instance_variable_get("@user")).to eq(user2)
          expect(Like.all).to include(like1)
        end
      end
    end
  end

  describe "Associations" do 
    
    before(:each) do 
      User.class_variable_set("@@all", [])
      Tweet.class_variable_set("@@all", [])
      Like.class_variable_set("@@all", [])
    end

    describe "Like" do 
      describe "#tweet (belongs to)" do 
        it "returns the tweet this like belongs to" do 
          expect(like1.tweet).to eq(tweet1)
        end
      end

      describe "#user (belongs to)" do 
        it "returns the user this like belongs to" do 
          expect(like1.user).to eq(user2)
        end
      end
    end

    describe "User" do 
      describe "#likes (has_many)" do 
        it "returns an array of likes that belong to this user" do 
          like1
          expect(user2.likes).to include(like1)
        end
      end

      describe "#liked_tweets (has_many, through)" do 
        it "returns an array of tweets that this user has liked" do 
          like1
          expect(user2.liked_tweets).to include(tweet1)
        end
      end
    end

    describe "Tweet" do 
      describe "#likes (has_many)" do 
        it "returns an array of likes that belong to this tweet" do 
          like1
          expect(tweet1.likes).to include(like1)
        end
      end

      describe "#likers (has_many, through)" do 
        it "returns an array of users that have liked this tweet" do 
          like1
          expect(tweet1.likers).to include(user2)
        end
      end
    end


  end
end