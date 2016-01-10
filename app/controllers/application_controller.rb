class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
 
  helper_method :mailbox, :conversation
  
  private


  def mailbox
    @mailbox ||= current_user.mailbox
  end

   def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end


  protected
  
  def user_params
  params.require(:user).permit(:employee_no, :first_name, :last_name, :date_of_birth, :email, :address, :mobile, :contract_type, :role, :ni, :work_permit, :password) 
end


 def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:employee_no, :first_name, :last_name, :date_of_birth, :email, :address, :mobile, :contract_type, :role, :ni, :work_permit, :password) }
  end

end