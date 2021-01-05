class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than: -1 }
  validate :must_carry_men_or_womens

  before_destroy :selective_destroy

  def must_carry_men_or_womens
    if !mens_apparel && !womens_apparel
      errors.add(:base, :invalid, message: "Store must carry at least one of men's or women's styles")
    end
  end

  private
    def selective_destroy
      if self.employees.size > 0
        return false
      end
    end
end