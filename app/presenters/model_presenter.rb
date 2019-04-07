class ModelPresenter
  include HtmlBuilder

  attr_reader :object, :view_content
  delegate :raw, :link_to, to: :view_content

  def initialize(object, view_content)
    @object = object
    @view_content = view_content
  end

  def created_at
    object.created_at.try(:strftime, '%Y/%m/%d %H:%M:%S')
  end

  def updated_at
    object.updated_at.try(:strftime, '%Y/%m/%d %H:%M:%S')
  end
end