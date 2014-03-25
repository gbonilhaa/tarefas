class Usuario < ActiveRecord::Base
	#jatinha add o has_secure
	has_secure_password
end
