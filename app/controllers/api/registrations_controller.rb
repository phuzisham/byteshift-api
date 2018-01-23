class API::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    super do |resource|
      resource.build_account(account_params) if resource.save
    end
  end

  private

  def account_params
    params.permit(:name)
  end
end
