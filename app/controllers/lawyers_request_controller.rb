class LawyersRequestController < LawyersBackofficeController
  before_action :set_user, only: [:accept, :finished]

  def index
    @users = User.without_lawyer(current_lawyer.brazilian_state_id)
  end

  def my_list
    @users = User.where(lawyer_id: current_lawyer.id)
  end

  def accept
    User.update_status(@user, :pending)
    Lawyer.append_users(lawyer, @user)

    redirect_to lawyers_request_index_path 
  end

  def finished
    User.update_status(@user, :finished)

    redirect_to lawyers_request_my_list_path 
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
