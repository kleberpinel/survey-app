 class BreadcrumbsOnRailsCustom < Builder

  def render
    @elements.collect do |element|
      render_element(element)
    end.join(@options[:separator] || " &raquo; dddd")
  end

  def render_element(element)
    if element.path == nil
      content = compute_name(element)
    else
      content = @context.link_to_unless_current(compute_name(element), compute_path(element), element.options)
    end
    if @options[:tag]
      @context.content_tag(@options[:tag], content)
    else
      content
    end
  end

end