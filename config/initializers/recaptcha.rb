Recaptcha.configure do |config|
  config.public_key  = '6LfxddASAAAAAHE7nG1GSpcaVdS41ijcfopZKK_1'
  config.private_key = ENV['RECAPTCHA_PRIVATE_KEY']
end