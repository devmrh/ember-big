class UserController < Amber::Controller::Base
  def index
    datas = User.all
    render("index.ecr")
  end

  def edit
    if post = User.find params["id"]
      render("edit.ecr")
    else
      flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/user"
    end
  end
end
