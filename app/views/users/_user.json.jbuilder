json.(user, :id, :email, :birthdate)
json.token user.generate_jwt
