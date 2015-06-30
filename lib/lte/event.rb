module LTE
	class Action
		attr_accessor :prompt_text

		def initialize(check_active, prompt_text, action)
			@check_active = check_active
			@prompt_text  = prompt_text
			@action       = action
		end

		def active?
			@check_active.call
		end

		def run
			@action.call
		end
	end
end
