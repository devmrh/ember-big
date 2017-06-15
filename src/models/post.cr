require "granite_orm/adapter/mysql"

class Post < Granite::ORM 
  adapter mysql

  # id : Int64 primary key is created for you
  field name : String
  field body : String
  field draft : Bool
  timestamps
end
