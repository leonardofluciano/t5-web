module ApplicationHelper
    def meta_title(title)
        content_for :title, title
    end
end
