module ApplicationHelper
  def visibility_icon(boolean, options={})
      options[:true_text] ||= ''
      options[:false_text] ||= ''
    if boolean
      content_tag(:span, options[:true_text], :class => 'glyphicon glyphicon-ok-circle')
    else
      content_tag(:span, options[:false_text], :class => 'glyphicon glyphicon-ban-circle')
    end
  end

  def error(object)
    render(:partial =>'errors/errors', :locals => {:object => object})    
  end

  def user_logged_in
    unless session[:user_id]
      return false
    else
      return true
    end
  end
end
