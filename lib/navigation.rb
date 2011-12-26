
def build_nav(base = "/", options = {})

  format = (options[:format] || "%s")
  fields = (options[:fields] || [:title])

  nav_items = @items.select { |item| item.identifier.match(base) and item.attributes[:order] }

  elements = nav_items.sort_by { |a| a.attributes[:order].to_i }.map do |item|

    # lolololol
    value = format % fields.map { |field| item.attributes[field] }

    %Q{<li><a href="#{@config[:baseurl]}#{item.identifier}">#{value}</a></li>}
  end

  elements.join("\n")
end
