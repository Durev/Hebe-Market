# frozen_string_literal: true

module ApplicationHelper
  # This method creates a link with `data-id` `data-fields` attributes.
  # These attributes are used to create new instances of the nested fields through Javascript.
  def add_nested_fields_link(body:, form_builder_object:, association:)
    new_object = form_builder_object.object.send(association).klass.new
    id = new_object.object_id

    fields = form_builder_object.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end

    link_to(body, '#', class: "addNestedFields", data: { id: id, fields: fields.delete("\n") })
  end
end
