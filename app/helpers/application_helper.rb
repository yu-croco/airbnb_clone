module ApplicationHelper

  # for vertical navbar at listing settings
  def controller?(controller)
    controller.include?(params[:controller])
  end

  # for vertical navbar at listing settings
  def action?(action)
    action.include?(params[:action])
  end
end
