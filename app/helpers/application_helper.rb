module ApplicationHelper

  def toggle_class_to(class_name, path_to_turn_on)
    class_name if request.fullpath == path_to_turn_on
  end

  def active_if(path)
    toggle_class_to('active-turn-this-green', path)
  end

  def container_fluid_if(path)
    request.fullpath == path ? 'container-fluid' : 'container'
  end
end
