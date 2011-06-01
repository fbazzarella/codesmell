# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_codesmell_session',
  :secret      => '86b2c23bf8d834818d1ec98f92a06265194ea04c5536978775cb4ba1b4340724a910eb7a8a9b982d73294d0066fbbd8e1d6746cefcc7f8a221c0e94e2c9361c4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
