class BucketsController < ApplicationController
  def index
    @buckets = Bucket.page(params[:page]).per(10)

    render("bucket_templates/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @activity = Activity.new
    @bucket = Bucket.find(params.fetch("id_to_display"))

    render("bucket_templates/show.html.erb")
  end

  def new_form
    @bucket = Bucket.new

    render("bucket_templates/new_form.html.erb")
  end

  def create_row
    @bucket = Bucket.new

    @bucket.location_id = params.fetch("location_id")
    @bucket.user_id = params.fetch("user_id")
    @bucket.bucket_name = params.fetch("bucket_name")
    @bucket.photo_id = params.fetch("photo_id")

    if @bucket.valid?
      @bucket.save

      redirect_back(:fallback_location => "/buckets", :notice => "Bucket created successfully.")
    else
      render("bucket_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_photo
    @bucket = Bucket.new

    @bucket.location_id = params.fetch("location_id")
    @bucket.user_id = params.fetch("user_id")
    @bucket.bucket_name = params.fetch("bucket_name")
    @bucket.photo_id = params.fetch("photo_id")

    if @bucket.valid?
      @bucket.save

      redirect_to("/photos/#{@bucket.photo_id}", notice: "Bucket created successfully.")
    else
      render("bucket_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_location
    @bucket = Bucket.new

    @bucket.location_id = params.fetch("location_id")
    @bucket.user_id = params.fetch("user_id")
    @bucket.bucket_name = params.fetch("bucket_name")
    @bucket.photo_id = params.fetch("photo_id")

    if @bucket.valid?
      @bucket.save

      redirect_to("/locations/#{@bucket.location_id}", notice: "Bucket created successfully.")
    else
      render("bucket_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bucket = Bucket.find(params.fetch("prefill_with_id"))

    render("bucket_templates/edit_form.html.erb")
  end

  def update_row
    @bucket = Bucket.find(params.fetch("id_to_modify"))

    @bucket.location_id = params.fetch("location_id")
    @bucket.user_id = params.fetch("user_id")
    @bucket.bucket_name = params.fetch("bucket_name")
    @bucket.photo_id = params.fetch("photo_id")

    if @bucket.valid?
      @bucket.save

      redirect_to("/buckets/#{@bucket.id}", :notice => "Bucket updated successfully.")
    else
      render("bucket_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @bucket = Bucket.find(params.fetch("id_to_remove"))

    @bucket.destroy

    redirect_to("/users/#{@bucket.user_id}", notice: "Bucket deleted successfully.")
  end

  def destroy_row_from_photo
    @bucket = Bucket.find(params.fetch("id_to_remove"))

    @bucket.destroy

    redirect_to("/photos/#{@bucket.photo_id}", notice: "Bucket deleted successfully.")
  end

  def destroy_row_from_location
    @bucket = Bucket.find(params.fetch("id_to_remove"))

    @bucket.destroy

    redirect_to("/locations/#{@bucket.location_id}", notice: "Bucket deleted successfully.")
  end

  def destroy_row
    @bucket = Bucket.find(params.fetch("id_to_remove"))

    @bucket.destroy

    redirect_to("/buckets", :notice => "Bucket deleted successfully.")
  end
end
