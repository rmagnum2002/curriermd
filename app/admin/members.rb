ActiveAdmin.register Member do
  actions :all, :except => [:new, :view]

  index do
    column :list do |membre|
      raw membre.list
    end
    column "Actions" do |membre|
      link_to "Edit", edit_admin_member_path(membre)
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :list, :label => "Membres:", :input_html => {:class => "ckeditor"}
    end
    f.buttons
  end


  show do
    attributes_table do
      row :list do |member|
        raw member.list
      end
    end
    active_admin_comments
  end
end

