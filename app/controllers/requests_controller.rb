class RequestsController < UsersBackofficeController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @request = current_user.request
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = current_user.request
    if(@request)
      redirect_to edit_request_url(@request) , notice: 'Request was successfully updated.'
    else
      @request = Request.new
    end
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    current_user.request = Request.new(request_params)
    @request = current_user.request

    if @request.save
      redirect_to requests_path, notice: 'Request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    if @request.update(request_params)
      redirect_to requests_path, notice: 'Request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    redirect_to requests_url, notice: 'Request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = current_user.request
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:title, :description, :user_id)
    end
end
