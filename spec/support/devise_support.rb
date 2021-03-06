module ValidUserRequestHelper
	include Warden::Test::Helpers
	Warden.test_mode!

  # for use in request specs
  def sign_in_as_a_valid_admin
    admin ||= FactoryGirl.create :admin
    login_as(admin, :scope => :user, :run_callbacks => false)
  end
  
  def sign_in_as_a_member
    member ||= FactoryGirl.create :member
    login_as(member, :scope => :user, :run_callbacks => false)
  end
end
