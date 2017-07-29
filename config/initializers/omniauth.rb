OmniAuth.config.logger = Rails.logger
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, "RRM8PXe37Xke8ONeylYpDsQTS", "M2NXXJSuA62azBuL1S8uQOfdp4hDlFC7IAlfdWvARtX6CfQcVb"
    provider :google_oauth2, "237805892874-tj7457sahjtu2l4de53phpn57joehe5t.apps.googleusercontent.com", "vcEkHk5t3z0MItJ_EUnhwxu6"
    provider :facebook, "991680984203209", "e909f4af3df829134c2300b9c7cca45a"
  end
  