class FollowersController < ApplicationController
  def index
    @followers = Follower.all

    render("follower_templates/index.html.erb")
  end

  def show
    @follower = Follower.find(params.fetch("id_to_display"))

    render("follower_templates/show.html.erb")
  end

  def new_form
    @follower = Follower.new

    render("follower_templates/new_form.html.erb")
  end

  def create_row
    @follower = Follower.new

    @follower.follower_user_id = params.fetch("follower_user_id")
    @follower.folowee_user_id = params.fetch("folowee_user_id")

    if @follower.valid?
      @follower.save

      redirect_back(:fallback_location => "/followers", :notice => "Follower created successfully.")
    else
      render("follower_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @follower = Follower.find(params.fetch("prefill_with_id"))

    render("follower_templates/edit_form.html.erb")
  end

  def update_row
    @follower = Follower.find(params.fetch("id_to_modify"))

    @follower.follower_user_id = params.fetch("follower_user_id")
    @follower.folowee_user_id = params.fetch("folowee_user_id")

    if @follower.valid?
      @follower.save

      redirect_to("/followers/#{@follower.id}", :notice => "Follower updated successfully.")
    else
      render("follower_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_follower_user
    @follower = Follower.find(params.fetch("id_to_remove"))

    @follower.destroy

    redirect_to("/users/#{@follower.follower_user_id}", notice: "Follower deleted successfully.")
  end

  def destroy_row_from_folowee_user
    @follower = Follower.find(params.fetch("id_to_remove"))

    @follower.destroy

    redirect_to("/users/#{@follower.folowee_user_id}", notice: "Follower deleted successfully.")
  end

  def destroy_row
    @follower = Follower.find(params.fetch("id_to_remove"))

    @follower.destroy

    redirect_to("/followers", :notice => "Follower deleted successfully.")
  end
end
