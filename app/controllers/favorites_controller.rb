class FavoritesController < ApplicationController
  def index
    @q = Favorite.ransack(params[:q])
    @favorites = @q.result(:distinct => true).includes(:bucket, :activity).page(params[:page]).per(10)

    render("favorite_templates/index.html.erb")
  end

  def show
    @favorite = Favorite.find(params.fetch("id_to_display"))

    render("favorite_templates/show.html.erb")
  end

  def new_form
    @favorite = Favorite.new

    render("favorite_templates/new_form.html.erb")
  end

  def create_row
    @favorite = Favorite.new

    @favorite.activity_id = params.fetch("activity_id")
    @favorite.bucket_id = params.fetch("bucket_id")

    if @favorite.valid?
      @favorite.save

      redirect_back(:fallback_location => "/favorites", :notice => "Favorite created successfully.")
    else
      render("favorite_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_bucket
    @favorite = Favorite.new

    @favorite.activity_id = params.fetch("activity_id")
    @favorite.bucket_id = params.fetch("bucket_id")

    if @favorite.valid?
      @favorite.save

      redirect_to("/buckets/#{@favorite.bucket_id}", notice: "Favorite created successfully.")
    else
      render("favorite_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_activity
    @favorite = Favorite.new

    @favorite.activity_id = params.fetch("activity_id")
    @favorite.bucket_id = params.fetch("bucket_id")

    if @favorite.valid?
      @favorite.save

      redirect_to("/activities/#{@favorite.activity_id}", notice: "Favorite created successfully.")
    else
      render("favorite_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @favorite = Favorite.find(params.fetch("prefill_with_id"))

    render("favorite_templates/edit_form.html.erb")
  end

  def update_row
    @favorite = Favorite.find(params.fetch("id_to_modify"))

    @favorite.activity_id = params.fetch("activity_id")
    @favorite.bucket_id = params.fetch("bucket_id")

    if @favorite.valid?
      @favorite.save

      redirect_to("/favorites/#{@favorite.id}", :notice => "Favorite updated successfully.")
    else
      render("favorite_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_bucket
    @favorite = Favorite.find(params.fetch("id_to_remove"))

    @favorite.destroy

    redirect_to("/buckets/#{@favorite.bucket_id}", notice: "Favorite deleted successfully.")
  end

  def destroy_row_from_activity
    @favorite = Favorite.find(params.fetch("id_to_remove"))

    @favorite.destroy

    redirect_to("/activities/#{@favorite.activity_id}", notice: "Favorite deleted successfully.")
  end

  def destroy_row
    @favorite = Favorite.find(params.fetch("id_to_remove"))

    @favorite.destroy

    redirect_to("/favorites", :notice => "Favorite deleted successfully.")
  end
end
