ActiveAdmin.register Store do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :summary, :published_at, :user_id
  #
  form stores: 'Create Store' do |f|
    inputs 'Details' do
      input :user
      input :name
      input :summary
      actions

     
    end
  end
  # or
  #
  # permit_params do
  #   permitted = [:name, :summary, :published_at, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
