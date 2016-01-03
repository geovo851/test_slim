module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"   # Green
    when "error"
      "alert-danger"    # Red
    when "alert"
      "alert-warning"   # Yellow
    when "notice"
      "alert-info"      # Blue
    else
      flash_type.to_s
    end
  end

  def find_role_admin
    User.select('users.name, roles.title').joins(:role).where('roles.title = ?', 'admin').first
  end

  def header_categories
    Category.first(5)
  end

  def footer_brands_men
    Brand.where(gender_id: Gender.find_by(title: 'man')).order(:id).first(8)
  end

  def footer_brands_women
    Brand.where(gender: Gender.find_by(title: 'woman')).order(:id).first(8)
  end

  def footer_sale
    Brand.where(gender: Gender.find_by(title: 'woman')).order(:id).first(4) + 
        Brand.where(gender: Gender.find_by(title: 'man')).order(:id).first(4)
  end

  def footer_quick_links
    Brand.where(gender: Gender.find_by(title: 'man')).order(:id).first(4) + 
        Brand.where(gender: Gender.find_by(title: 'woman')).order(:id).first(4)
  end
end
