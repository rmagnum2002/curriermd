ActiveAdmin.register About do
  form do |f|
    f.inputs "Details" do
      f.input :details, :label => "A propos de nous:", :input_html => {:class => "ckeditor", :toolbar => 'Full'}
    end
    f.buttons
  end

  show do
    render "about"
    active_admin_comments
  end
end

