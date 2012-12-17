ActiveAdmin.register About do
actions :all, :except => [:destroy, :new]
  index do
    selectable_column
    column "Details" do |about|
      raw about.details
    end
    default_actions
  end

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

