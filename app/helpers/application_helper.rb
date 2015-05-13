module ApplicationHelper
	def flass_class(type)
		case type
			when :success then "success"
			when :alert	  then "warning"
			when :error   then "warning"
			when :notice  then ""
			else "info"
		end
	end
end
