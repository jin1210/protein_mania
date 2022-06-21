class Item < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :kcal, presence: true
  validates :image, presence: true
  validates :protein, presence: true
  validates :fat, presence: true
  validates :carbohydrate, presence: true
  validates :protein_type, presence: true
  validates :price, presence: true
  validates :volume, presence: true
  validates :flavor, presence: true
  validates :brand, presence: true


  def self.search(params)

    if params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and kcal<= ? and protein >= ? and protein <= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and kcal<= ? and protein >= ? and protein <= ? and fat <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:fat])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and kcal<= ? and protein >= ? and protein <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and kcal<= ? and protein >= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:low_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and kcal<= ? and protein <= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:high_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and protein >= ? and protein <= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal<= ? and protein >= ? and protein <= ? and fat <= ? and carbohydrate <= ?', params[:item][:high_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and kcal<= ? and protein >= ? and protein <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:low_protein], params[:item][:high_protein])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and kcal<= ? and protein >= ? and fat <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:low_protein], params[:item][:fat])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and kcal<= ? and protein <= ? and fat <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:high_protein], params[:item][:fat])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and protein >= ? and protein <= ? and fat <= ?', params[:item][:low_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:fat])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal<= ? and protein >= ? and protein <= ? and fat <= ?', params[:item][:high_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:fat])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and kcal<= ? and protein >= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:low_protein], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and kcal<= ? and protein <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:high_protein], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and protein >= ? and protein <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal<= ? and protein >= ? and protein <= ? and carbohydrate <= ?', params[:item][:high_kcal], params[:item][:low_protein], params[:item][:high_protein], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and kcal<= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and protein >= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:low_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal<= ? and protein >= ? and fat <= ? and carbohydrate <= ?',params[:item][:high_kcal], params[:item][:low_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and protein <= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal<= ? and protein <= ? and fat <= ? and carbohydrate <= ?', params[:item][:high_kcal], params[:item][:high_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('protein >= ? and protein <= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_protein], params[:item][:high_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and kcal<= ? and protein >= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:low_protein])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and kcal<= ? and protein <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:high_protein])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and protein >= ? and protein <= ?', params[:item][:low_kcal], params[:item][:low_protein], params[:item][:high_protein])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal<= ? and protein >= ? and protein <= ?', params[:item][:high_kcal], params[:item][:low_protein], params[:item][:high_protein])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and kcal<= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:high_kcal], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and protein >= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:low_protein], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal<= ? and protein >= ? and carbohydrate <= ?', params[:item][:high_kcal], params[:item][:low_protein], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and fat <= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal<= ? and fat <= ? and carbohydrate <= ?', params[:item][:high_kcal], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].present? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('protein <= ? and fat <= ? and carbohydrate <= ?', params[:item][:high_protein], params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and kcal<= ?', params[:item][:low_kcal], params[:item][:high_kcal])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ? and protein >= ?', params[:item][:low_kcal], params[:item][:low_protein])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal<= ? and protein >= ?', params[:item][:high_kcal], params[:item][:low_protein])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal >= ? and carbohydrate <= ?', params[:item][:low_kcal], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('kcal<= ? and carbohydrate <= ?', params[:item][:high_kcal], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].present?
      @items = Item.where('fat <= ? and carbohydrate <= ?', params[:item][:fat], params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('protein >= ? and protein <= ?', params[:item][:low_protein], params[:item][:high_protein])

    elsif params[:item][:low_kcal].present? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal >= ?', params[:item][:low_kcal])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].present? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('kcal<= ?', params[:item][:high_kcal])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].present?
      @items = Item.where('carbohydrate <= ?',params[:item][:carbohydrate])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].blank? && params[:item][:fat].present? && params[:item][:carbohydrate].blank?
      @items = Item.where('fat <= ?', params[:item][:fat])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].blank? && params[:item][:low_protein].blank? && params[:item][:high_protein].present? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('protein <= ?', params[:item][:high_protein])

    elsif params[:item][:low_kcal].blank? && params[:item][:high_kcal].blank? && params[:item][:low_protein].present? && params[:item][:high_protein].blank? && params[:item][:fat].blank? && params[:item][:carbohydrate].blank?
      @items = Item.where('protein >= ?', params[:item][:low_protein])

    else
      @items = Item.all
    end

  end

end
