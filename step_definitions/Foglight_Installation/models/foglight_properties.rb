class FoglightProperties

  attr_accessor :user_install_dir, :fms_license_file

  def initialize
    @user_install_dir = ""
    @fms_license_file = ""
  end

  # Support templating of properties data.
  def get_binding
    binding
  end
end