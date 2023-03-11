# encrypt a secret and puts encrypted string
secret = "places"
puts secret
encrypted_string = BCrypt::Password.create(secret)
puts encrypted_string

# prepare encrypted string for testing
# test secret against prepared encrypted string
user_entered_secret = "places"
result = BCrypt::Password.new(encrypted_string) == user_entered_secret
puts result




