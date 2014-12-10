class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :users

  # def self.search(search)
  #   if search
  #     #find (:all, :conditions => ['name LIKE ?'], "%#{search}%"])
  #   else
  #     find (:all)
  #   end
  # end

  #this is just for searching the databse, not the API. taken from https://www.youtube.com/watch?v=jKSm8kOWd_0



end
