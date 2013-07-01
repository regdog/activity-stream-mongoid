class Activity
  include Streama::Activity

  activity :new_article do 
    actor :user
    object :article
    target_object :community
  end

  activity :new_question do 
    actor :user
    object :question
    target_object :community
  end

  activity :comment do 
    actor :user
    object :article
    target_object :community
  end

  def the_actor
    actor["type"].to_s.camelize.constantize.find_by(id: actor["id"])
  end  

  def the_object
    object["type"].to_s.camelize.constantize.find_by(id: object["id"])
  end

  def the_target
    target_object["type"].to_s.camelize.constantize.find_by(id: target_object["id"])
  end
end