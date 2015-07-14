module ItemsHelper

  def all_categories
    Category.all.map{ |cat| [cat.name, cat.id] }
  end
end
