module Amber::Controller
  module Render
    LAYOUT = "application.slang"

    macro render(filename, layout = true, path = "src/views", folder = __FILE__)
    {% file_path = folder.split("/") %}
    # Determine the full file path to render
    {% if filename.id.includes?("/") %}
    {% template = filename %}
      {% elsif folder.id.ends_with?(".ecr") %}
    {% template = path + "/" + file_path[-2] + "/" + filename %}
    {% else %}
        # When render is called from the controllers get the controller name to
        # build the file path
        {% controller_name = file_path.last.gsub(/\_controller\.cr|\.cr/, "") %}
    {% cleaned = filename.gsub(/\.ecr/, "") %}
    {% template = path + "/" + controller_name + "/" + cleaned %}
    {% end %}

    content = render_template({{template}}, {{path}})

    {% if layout && !filename.id.split("/").last.starts_with?("_") %}
    {% current_layout = (layout.class_name == "StringLiteral") ? layout : LAYOUT %}
        {% layout_path  = "layouts/" + current_layout %}
    render_template({{layout_path}}, {{path}})
    {% end %}
  end

  macro render_template(filename, path = "src/views")
  {% if filename.id.split("/").size > 2 %}
  Kilt.render("{{filename.id}}")
  {% else %}
        Kilt.render("#{{{path}}}/{{filename.id}}")
      {% end %}
    end
  end
end