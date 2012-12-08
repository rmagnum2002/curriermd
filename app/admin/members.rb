ActiveAdmin.register Member do
  form do |f|
    f.inputs "Details" do
      f.input :list, :label => "Membres:", :input_html => {:class => "ckeditor", :toolbar => 'Full'}
    end
    f.buttons
  end

  show do
    render "member"
    active_admin_comments
  end
end

