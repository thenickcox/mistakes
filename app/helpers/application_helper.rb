module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def formatted_date(post)
    "Posted on #{post.date.try(:strftime, "%B %d, %Y")}"
  end

  def render_post(post)
    find_and_preserve(post.content_html.html_safe)
  end

end
