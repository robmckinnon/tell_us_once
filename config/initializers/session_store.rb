# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tell_us_once_session',
  :secret      => '143d85d0886d4a20731e0b956809c69d4a05c978b0d29b4c0e9a958ac77c8517bdf05ea2bf461f5f4218a6b7201d570f6cc113e18148ea04c521f56349084605'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
