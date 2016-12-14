class PrivateParkingsController < ApplicationController
  before_action :current_user_must_be_private_parking_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_private_parking_user
    private_parking = PrivateParking.find(params[:id])

    unless current_user == private_parking.offeree_user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @private_parkings = PrivateParking.page(params[:page]).per(10)

    render("private_parkings/index.html.erb")
  end

  def show
    @private_parking = PrivateParking.find(params[:id])

    render("private_parkings/show.html.erb")
  end

  def new
    @private_parking = PrivateParking.new

    render("private_parkings/new.html.erb")
  end

  def create
    @private_parking = PrivateParking.new

    @private_parking.offeree_user_id = params[:offeree_user_id]
    @private_parking.acceptee_user_id = params[:acceptee_user_id]
    @private_parking.date = params[:date]
    @private_parking.time = params[:time]

    save_status = @private_parking.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/private_parkings/new", "/create_private_parking"
        redirect_to("/private_parkings")
      else
        redirect_back(:fallback_location => "/", :notice => "Private parking created successfully.")
      end
    else
      render("private_parkings/new.html.erb")
    end
  end

  def edit
    @private_parking = PrivateParking.find(params[:id])

    render("private_parkings/edit.html.erb")
  end

  def update
    @private_parking = PrivateParking.find(params[:id])

    @private_parking.offeree_user_id = params[:offeree_user_id]
    @private_parking.acceptee_user_id = params[:acceptee_user_id]
    @private_parking.date = params[:date]
    @private_parking.time = params[:time]

    save_status = @private_parking.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/private_parkings/#{@private_parking.id}/edit", "/update_private_parking"
        redirect_to("/private_parkings/#{@private_parking.id}", :notice => "Private parking updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Private parking updated successfully.")
      end
    else
      render("private_parkings/edit.html.erb")
    end
  end

  def destroy
    @private_parking = PrivateParking.find(params[:id])

    @private_parking.destroy

    if URI(request.referer).path == "/private_parkings/#{@private_parking.id}"
      redirect_to("/", :notice => "Private parking deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Private parking deleted.")
    end
  end
end
