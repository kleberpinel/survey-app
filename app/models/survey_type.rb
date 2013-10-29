class SurveyType

	attr_reader :id, :name, :label

	def initialize args=nil
		if args != nil
			args.each do |k,v|
				instance_variable_set("@#{k}", v) unless v.nil?
			end
		end
	end

	@@TYPES = [
		SurveyType.new(:id => 1, :name => "text_type", :label => "Texto"),
		SurveyType.new(:id => 2, :name => "combo_box", :label => "Combo Box"),
		SurveyType.new(:id => 3, :name => "radio", :label => "Radio")
	]

	def self.types
		@@TYPES
	end

end