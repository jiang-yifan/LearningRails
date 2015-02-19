require_relative '../phase5/controller_base'

module Phase6
  class ControllerBase < Phase5::ControllerBase
    # use this with the router to call action_name (:index, :show, :create...)
    def invoke_action(name)
      send(name)
      unless res.body
        render(name.to_s)
      end
    end
  end
end
