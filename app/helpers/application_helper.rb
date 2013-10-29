
module ApplicationHelper

	def flash_class(level)
		Rails.logger.debug "#{level}"
	    case level
	        when :notice then "alert alert-info"
	        when :success then "alert alert-success"
	        when :error then "alert alert-danger"
	        when :alert then "alert alert-warning"
	    end
	end

	def is_active?(page_name)
		
		Rails.logger.debug "#{params[:action]}"
	  	"active" if params[:action] == page_name
	end
end
