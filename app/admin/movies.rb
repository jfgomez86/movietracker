ActiveAdmin.register Movie do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Movie", :multipart => true do
      f.input :title
      f.input :synopsis
      f.input :release_date, as: :date, start_year: 1970, end_year: 2014
      f.input :poster, :as => :file,
                       :hint => f.template.image_tag(f.object.poster.url(:medium))
      #f.label :uri_trailer
      f.input :uri_trailer, hint: "Video identifier found in the URL of Youtube.<br>
                                  for example http://www.youtube.com/watch?v=<span style=\"background:#C6E2FF;\">0uIWGOKW5OM</span>".html_safe
    end
    f.buttons
  end
  index do
    column :title
    column :synopsis, as: :text
    column :release_date
    column "Poster" do |movie| 
        link_to image_tag("/assets/posters/#{movie.id}/medium/#{movie.poster_file_name}",
                           :alt => "poster"), admin_movie_path(movie)
    end
    default_actions
  end
  show do
    attributes_table do
      row :title
      row :synopsis
      row :release_date
      row :posters do
        image_tag(movie.poster.url(:medium))
      end
    end
    active_admin_comments
  end
end
