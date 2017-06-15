require "granite_orm/adapter/mysql"

class User < Granite::ORM
  adapter mysql

  field name : String
  field username : String
  field password : String
  field email : String
  field address : String
  field phone : Int32
  field brith : Time
  field registered : Time

  # id : Int64 primary key is created for you
end
