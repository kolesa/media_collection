class MainFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, :pluralize, :raw, :link_to, :image_tag, :t, :back_button, to: :@template

  def error_messages
    return nil unless object.errors.any?
    content_tag :div, id: 'error_explanation', class: 'alert alert-danger' do
      content_tag(:h2, "#{t 'save_errors'}: #{object.errors.count}") + content_tag(:ul, raw(error_items))
    end
  end

  def text_field_bootstrap(name, *args)
    content_tag :div, class: 'form-group' do
      label_bootstrap(name) + content_tag(:div, text_field(name, form_field_args(*args)), class: 'controls')
    end
  end

  def image_field_bootstrap(name, *args)
    content_tag :div, class: 'form-group' do
      label_bootstrap(name) + content_tag(:div, file_field(name, args_with_class(*args, 'form-control')), class: 'controls')
    end
  end

  def select_field_bootstrap(name, *args)
    content_tag :div, class: 'form-group' do
      label_bootstrap(name) + content_tag(:div, select(name, *args, class: 'select2'), class: 'controls')
    end
  end

  def check_box_bootstrap(name, *args)
    content_tag :div, class: 'form-group' do
      content_tag :div, class: 'controls' do
        check_box(name, *args) + label(name)
      end
    end
  end

  def main_submit
    submit 'Создать', class: 'btn btn-success'
  end

  private

  def label_bootstrap(name)
    label(name, class: 'control-label')
  end

  def args_with_class(*args, klass)
    default_options = args.extract_options!
    class_from_args = default_options[:class]
    default_options.merge!(class: "#{klass} #{class_from_args}")
  end

  def form_field_args(*args)
    args_options = args.extract_options!
    class_from_args = args_options[:class]
    args_options[:class] = "form-control #{class_from_args}"
    {}.merge! args_options
  end
end