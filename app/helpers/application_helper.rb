module ApplicationHelper
  def form_errors_for(object = nil)
    if object.present? && object.errors && (object.errors.count > 0)
      render('shared/form_errors', object: object)
    end
  end
end
