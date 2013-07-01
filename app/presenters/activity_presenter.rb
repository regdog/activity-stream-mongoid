# coding: utf-8
class ActivityPresenter < BasePresenter
  presents :activity

  def text
  	case activity.verb
  	when :new_article
  	  out = %(#{raw link_to(activity.the_actor.name, activity.the_actor)} 写了新文章 #{raw link_to(activity.the_object.title, [activity.the_target, activity.the_object])})	
  	when :new_question
  	  out = %(#{raw link_to(activity.the_actor.name, activity.the_actor)} 发起了新问题 #{raw link_to(activity.the_object.title, [activity.the_target, activity.the_object])})		
  	when :comment
  	else
  	end	
  	return raw out
  end	
end  