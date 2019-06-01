class ActivitiesController < ApplicationController
  def index
    @activities = Activity.page(params[:page]).per(10)

    render("activity_templates/index.html.erb")
  end

  def show
    @comment = Comment.new
    @favorite = Favorite.new
    @activity = Activity.find(params.fetch("id_to_display"))

    render("activity_templates/show.html.erb")
  end

  def new_form
    @activity = Activity.new

    render("activity_templates/new_form.html.erb")
  end

  def create_row
    @activity = Activity.new

    @activity.activity_type = params.fetch("activity_type")
    @activity.title = params.fetch("title")
    @activity.yelp_link = params.fetch("yelp_link")
    @activity.bucket_id = params.fetch("bucket_id")
    @activity.photo_id = params.fetch("photo_id")
    @activity.location_id = params.fetch("location_id")
    @activity.status = params.fetch("status")

    if @activity.valid?
      @activity.save

      redirect_back(:fallback_location => "/activities", :notice => "Activity created successfully.")
    else
      render("activity_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_bucket
    @activity = Activity.new

    @activity.activity_type = params.fetch("activity_type")
    @activity.title = params.fetch("title")
    @activity.yelp_link = params.fetch("yelp_link")
    @activity.bucket_id = params.fetch("bucket_id")
    @activity.photo_id = params.fetch("photo_id")
    @activity.location_id = params.fetch("location_id")
    @activity.status = params.fetch("status")

    if @activity.valid?
      @activity.save

      redirect_to("/buckets/#{@activity.bucket_id}", notice: "Activity created successfully.")
    else
      render("activity_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_photo
    @activity = Activity.new

    @activity.activity_type = params.fetch("activity_type")
    @activity.title = params.fetch("title")
    @activity.yelp_link = params.fetch("yelp_link")
    @activity.bucket_id = params.fetch("bucket_id")
    @activity.photo_id = params.fetch("photo_id")
    @activity.location_id = params.fetch("location_id")
    @activity.status = params.fetch("status")

    if @activity.valid?
      @activity.save

      redirect_to("/photos/#{@activity.photo_id}", notice: "Activity created successfully.")
    else
      render("activity_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @activity = Activity.new

    @activity.activity_type = params.fetch("activity_type")
    @activity.title = params.fetch("title")
    @activity.yelp_link = params.fetch("yelp_link")
    @activity.bucket_id = params.fetch("bucket_id")
    @activity.photo_id = params.fetch("photo_id")
    @activity.location_id = params.fetch("location_id")
    @activity.status = params.fetch("status")

    if @activity.valid?
      @activity.save

      redirect_to("/locations/#{@activity.location_id}", notice: "Activity created successfully.")
    else
      render("activity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @activity = Activity.find(params.fetch("prefill_with_id"))

    render("activity_templates/edit_form.html.erb")
  end

  def update_row
    @activity = Activity.find(params.fetch("id_to_modify"))

    @activity.activity_type = params.fetch("activity_type")
    @activity.title = params.fetch("title")
    @activity.yelp_link = params.fetch("yelp_link")
    @activity.bucket_id = params.fetch("bucket_id")
    @activity.photo_id = params.fetch("photo_id")
    @activity.location_id = params.fetch("location_id")
    @activity.status = params.fetch("status")

    if @activity.valid?
      @activity.save

      redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
    else
      render("activity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_bucket
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

    redirect_to("/buckets/#{@activity.bucket_id}", notice: "Activity deleted successfully.")
  end

  def destroy_row_from_photo
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

    redirect_to("/photos/#{@activity.photo_id}", notice: "Activity deleted successfully.")
  end

  def destroy_row_from_location
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

    redirect_to("/locations/#{@activity.location_id}", notice: "Activity deleted successfully.")
  end

  def destroy_row
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

    redirect_to("/activities", :notice => "Activity deleted successfully.")
  end
end
