class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, inclusion: 40..200
  validates :store_id, presence: true

  # before_create :create_password
  # after_create :create_password
  before_save :create_password

  # # before_create / before_save way
  private
    def create_password
      self.password = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
    end

  # # much worse after_create way
  # private
  #   def create_password
  #     elf = Employee.where("created_at < ? ", Time.now).order('created_at DESC').first
  #     elf.password = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
  #   end
end

# Save returns either true or false depending on whether the object was saved successfully to the database or not.
# Create will return the model regardless of whether the object was saved or not.