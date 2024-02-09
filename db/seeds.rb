# Populate the database with the categories in all environments
%w[general business entertainment health science sports technology].each do |category|
  Category.find_or_create_by(name: category)
end
