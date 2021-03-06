class LocationsController < ApplicationController
  def index
    @q = Location.ransack(params[:q])
    @locations = @q.result(:distinct => true).includes(:user, :lists, :users, :activities).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@locations.where.not(:address_latitude => nil)) do |location, marker|
      marker.lat location.address_latitude
      marker.lng location.address_longitude
      marker.infowindow "<h5><a href='/locations/#{location.id}'>#{location.city_name}</a></h5><small>#{location.address_formatted_address}</small>"
    end

    render("location_templates/index.html.erb")
  end

  def show
    @activity = Activity.new
    @user = User.new
    @bucket = Bucket.new
    @location = Location.find(params.fetch("id_to_display"))

    render("location_templates/show.html.erb")
  end

  def new_form
    @location = Location.new

    render("location_templates/new_form.html.erb")
  end

  def create_row
    @location = Location.new

    @location.city_name = params.fetch("city_name")
    @location.address = params.fetch("address")
    @location.state_name = params.fetch("state_name")
    @location.country_name = params.fetch("country_name")
    @location.created_by_user_id = params.fetch("created_by_user_id")

    if @location.valid?
      @location.save

      redirect_back(:fallback_location => "/locations", :notice => "Location created successfully.")
    else
      render("location_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @location = Location.find(params.fetch("prefill_with_id"))

    render("location_templates/edit_form.html.erb")
  end

  def update_row
    @location = Location.find(params.fetch("id_to_modify"))

    @location.city_name = params.fetch("city_name")
    @location.address = params.fetch("address")
    @location.state_name = params.fetch("state_name")
    @location.country_name = params.fetch("country_name")
    @location.created_by_user_id = params.fetch("created_by_user_id")

    if @location.valid?
      @location.save

      redirect_to("/locations/#{@location.id}", :notice => "Location updated successfully.")
    else
      render("location_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @location = Location.find(params.fetch("id_to_remove"))

    @location.destroy

    redirect_to("/users/#{@location.created_by_user_id}", notice: "Location deleted successfully.")
  end

  def destroy_row
    @location = Location.find(params.fetch("id_to_remove"))

    @location.destroy

    redirect_to("/locations", :notice => "Location deleted successfully.")
  end
end
