module RolesHelper
  def can_edit?(future)
    case(current_user.role)
    when 'admin' then true
    when 'registered' then future.user == current_user
    else false
    end
  end

  def can_edit_user?(user)
    case(current_user.role)
    when 'admin' then true
    when 'registered' then user == current_user
    else false
    end
  end
end
