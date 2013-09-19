module ApplicationHelper

  def active(controller, args)
    except_actions = args[:except_actions].present? ? args[:except_actions] : []
    controller == params['controller'] and (not except_actions.include?(params['action'])) ? 'active' : ''
  end

  def sub_active(slug)
    "#{params['controller']}##{params['action']}" == slug ? 'active' : ''
  end

end
