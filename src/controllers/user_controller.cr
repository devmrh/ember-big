class UserController < Amber::Controller::Base
  def index
    datas = User.all
    render("index.ecr")
  end

  # def edit
  #   if post = User.find params["id"]
  #     render("edit.ecr")
  #   else
  #     flash["warning"] = "Post with ID #{params["id"]} Not Found"
  #     redirect_to "/user"
  #   end
  # end
  def edit
    if post = User.find params["id"]
      render("edit.ecr")
    else
      flash["warning"] = "post with id #{params["id"]} not found"
      redirect_to "/user"
    end
  end

  def update
    if post = User.find(params["id"])
      post.set_attributes(params.to_h.select(["name", "username"]))
      if post.valid? && post.save
        flash["success"] = "Updated Post successfully."
        redirect_to "/user"
      else
        flash["danger"] = "Could not update Post!"
        render("edit.ecr")
      end
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/user"
    end
  end


end
