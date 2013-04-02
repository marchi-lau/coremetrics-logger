class Account < ActiveRecord::Base
  attr_accessible :api_key, :client_id, :company_id, :name
end
