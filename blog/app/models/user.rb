class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :login, :password
  
  validates :first_name,  :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :login, :presence => true  
  validates :password, :presence => true  


end
