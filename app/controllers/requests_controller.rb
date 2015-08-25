class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy]

  def new
    # We instantiate an instance var of the obj we'd like to create
    # in order to use the 'form_for' helper method in Rails to easily generate
    # a form that submits to the create action
    @request = Request.new()
    @search = ''
    @sortby = ''
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to requests_path
    else
      flash[:alert] = "See errors below"
      render :new
    end
  end

  # GET /requests/:id (e.g. /requests/1)
  # this is used to show a page with request information
  def show
    # Instance variable defined in before_action
  end

  # GET /requests
  # this is used to show a page with listing of all the requests in our DB
  def index
    # @requests = Request.all.order(:done)
    # Code below for use with Kaminari
    @requests = Request.order(:done).page(params[:page]).per(10)
  end

  # GET /requests/:id/edit (e.g. /requests/123/edit)
  # this is used to show a form to edit and submit to update a request in the db
  def edit
    # Instance variable defined in before_action
  end

  # PATCH /requests/:id (e.g. /requests/123)
  # this is used to handle the submission of the request form from the edit page
  # when user is updating the information on a request
  def update
    # Instance variable defined in before_action
    @request.update({done: (@request.done==0 ? 1 : 0)})
    redirect_to requests_path
  end

  # DELETE /requests/:id (e.g. /requests/123)
  # this is used to delete a request from the database
  def destroy
    # Instance variable defined in before_action
    @request.destroy
    redirect_to requests_path
  end

  private

  def find_request
    @request = Request.find params[:id]
  end

  def request_params
    params.require(:request).permit([:name, :email, :department, :message, :done])
  end

end
