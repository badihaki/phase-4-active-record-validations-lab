class Post < ApplicationRecord
    # has title
    # at least 250 characters long
    # category is either fiction or ninfiction. requires inclusion validator
    # make sure title isnt click bait-y
    validate :check_clickbaity_ness
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction","Non-Fiction"]  }

    def check_clickbaity_ness
        clickbait_titles = ["Won't Believe", "Secret", "Top", "Guess"]
        good_title = false

        if title
            clickbait_titles.each do |bait|
                if title.include? bait
                    good_title = true
                    break
                else
                    good_title = false
                end
            end
        end
        
        if good_title == false
            errors.add(:title, "Title not clickbait-y enough")
        end
        
        # if title.exclude? "Won't Believe" or title.exclude? "Secret" or title.exclude? "Top" or title.exclude? "Guess"
            # errors.add(:title, "bad title")
        # end

       # if title.include? "Won't Believe"
       # elsif title.include? "Secret"
       # elsif title.include? "Top"
       # elsif title.include? "Guess"
       # else
        # errors.add(:title, "bad title")
       # end

    end

end
