OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '203893054460-65ts4321l4ubcstav9cgcqje7ja94g0e.apps.googleusercontent.com', 'C63-_KWFHox40QInDEDqEBJ0', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end