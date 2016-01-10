class Person < ActiveRecord::Base
  def update_zip zip_code
    self.update_attributes(zip_code: zip_code)
  end
end
