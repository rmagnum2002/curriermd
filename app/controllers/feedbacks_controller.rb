class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(permitted_params)
    if @feedback.save
      UserMailer.feedback(@feedback).deliver
      redirect_to contact_path, notice: 'Feedback sent. Thank you!'
    else
      redirect_to contact_path, notice: 'Feedback not sent.'
    end
  end

  private

  def permitted_params
    params[:feedback].permit!
  end
end
