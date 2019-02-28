module ApplicationHelper
  def form_errors_for(object=nil)
    if object.present? and object.errors and object.errors.count > 0
      render('shared/form_errors', object: object)
    end
  end
end
