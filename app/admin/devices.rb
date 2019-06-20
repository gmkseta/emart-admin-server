ActiveAdmin.register Device do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
    menu priority: 3
    permit_params :zipcode, :address, :address_detail, :latlng_x, :latlng_y

    form partial: 'form'

    show do
        attributes_table title: "매대 상세보기" do
            row :number
            row :name
            row :address
            row :address_detail
            row :zipcode
            row 'x좌표' do
                div resource.latlng_x, id: 'latlng_x', data: resource.latlng_x
            end
            row 'y좌표' do
                div resource.latlng_y, id: "latlng_y", data: resource.latlng_y
            end
            row '지도 보기' do
                div '', id: 'map', style: "width:20rem; height:20rem;"
            end
            render 'map_script'
        end
    end
end
