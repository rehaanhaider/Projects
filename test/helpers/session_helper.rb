module SessionHelper

  def sign_in_as(email, password)
    params = {
      "user" => {
        "email" => "a@samplep.com",
        "password" => "123456"
      }
    }
    post login_path, params
  end
end