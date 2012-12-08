class WelcomeController < ApplicationController

    def set_locale
    request_language = request.env['HTTP_ACCEPT_LANGUAGE']
    request_language = request_language.nil? ? nil : request_language[/[^,;]+/]

    if LOCALES.keys.include?(l = params[:lang]) && cookies[:lang] != l
      cookies[:lang] = {:value => l, :expires => 1.year.from_now}
    end

    if params[:back] !~ /^\//
      redirect_to root_path
    else
      redirect_to((params[:back]).gsub(/[\r\n]/, ''))
    end
  end

  def index
    @class_home = true
    @main_articles = Article.order('created_at desc').limit(5)
    @recomends = Article.where(recomend: true).order('created_at desc').limit(3)
  end

  def about
    @class_about = true
    @about = About.first
  end

  def participate
    @class_participate = true
  end

  def contact
    @class_contact = true
  end

  def membres
    @class_membres = true
    @membre = Member.first
  end

  def feedback
    @feedback = Feedback.new
    if request.post?
      @feedback = Feedback.new params[:feedback]
        if @feedback.save
          UserMailer.feedback(@feedback).deliver
        end
      redirect_to contact_path, :notice => "Feedback sent. Thank you!"
    end
  end

end
