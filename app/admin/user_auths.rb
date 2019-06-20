ActiveAdmin.register UserAuth do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_id, :id_card, :face_image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
    menu priority: 2
    index do
        id_column
        column :user
        column "신분증 사진" do |obj|
            image_tag obj.id_card_url.present? ? obj.id_card_url : '/' ,class: "thumb",style: "height: 12em; max-width:30em; width:auto"
        end
        column "실물 사진" do |obj|
            image_tag obj.face_image_url.present? ? obj.face_image_url : '/' ,class: "thumb",style: "height: 12em; max-width:30em; width:auto"
        end
        column :auth do |obj|
            label class:"switch" do
                render "toggle", id:obj.id, auth: obj.user.auth
            end
        end
        column :created_at
    
        actions
    end

    member_action :toggle, method: :post do
        @user_auth = UserAuth.find(params[:id])
        @user = @user_auth.user
        @user.auth? ? @user.unauth! : @user.auth!        
        respond_to do |format|
            format.js
        end
    end

  

end
