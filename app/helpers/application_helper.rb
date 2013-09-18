module ApplicationHelper

  def active(controller)
    controller == params['controller'] ? 'active' : ''
  end

  def sub_active(slug)
    "#{params['controller']}##{params['action']}" == slug ? 'active' : ''
  end
end
