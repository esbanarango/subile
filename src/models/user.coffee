mongoose = require 'mongoose'

# User model
User = new mongoose.Schema(
  email: {type: String, unique: true}
  password: {type: String, index: true}
  first_name: String
  last_name: String
  social_networks:
    twitter: {type: String, unique: true}
    facebook: {type: String, unique: true}
    github: {type: String, unique: true}
)

module.exports = mongoose.model 'User', User