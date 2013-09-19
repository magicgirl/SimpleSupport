module ApplicationHelper

  def active(controller, args = {})
    except_actions = args[:except_actions].present? ? args[:except_actions] : []
    controller == params['controller'] and (not except_actions.include?(params['action'])) ? 'active' : ''
  end

  def sub_active(slug)
    "#{params['controller']}##{params['action']}" == slug ? 'active' : ''
  end

  def support_area_active(id = false)
    current_id = params[:support_area_id].present? ? params[:support_area_id] : false
    id = id.to_s if id
    sub_active('tickets#index') == 'active' and current_id == id ? 'active' : ''
  end
end
