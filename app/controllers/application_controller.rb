# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
	
  before_filter :setup_variables, :set_locale

  def setup_variables
    @languages = Language.all
    @vote_options = VoteOption.all
  end
  
	def set_locale 		
		I18n.locale = params[:locale] 
	end  
end
