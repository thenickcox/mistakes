class Post < ActiveRecord::Base
  before_save :generate_content_html
  validates :content, :title, presence: true
  validates :nickname, absence: true
  acts_as_taggable

  protected

  def generate_content_html
    return if content.blank?
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(:hard_wrap => false),
      :no_intra_emphasis => true,
      :autolink => true,
      :disable_indented_code_blocks => false,
      :fenced_code_blocks => true,
      :space_after_headers => true)

    self.content_html = Redcarpet::Render::SmartyPants.render(
      Lib::SyntaxHighlighter.new(markdown.render(content)).to_s)
  end

end
