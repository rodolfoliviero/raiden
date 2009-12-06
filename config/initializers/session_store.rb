# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_raiden_session',
  :secret      => '49884eb4419efc63b234d58a59c8e7b4ffa17d74fc717d00dae4fa6c27430a7af33ce2678db4f5ae96023614e855c69294230b277c7da6d89b955aecb971bbcd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
