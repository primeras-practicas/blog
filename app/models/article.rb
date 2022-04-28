class Article < ApplicationRecord
    belongs_to :user
    has_many :has_categories
    has_many :categories, through: :has_categories
    has_one_attached :image
    has_many :comments, dependent: :destroy
    has_rich_text :content
    attr_accessor :category_elements

    def save_categories
        #category_elements [1,2,3]
        #iterar ese arreglo
        #binding.break "es el adios bug"
        return has_categories.destroy_all if category_elements.nil? ||category_elements.empty?

        has_categories.where.not(category_id: category_elements).destroy_all

        category_elements.each do |category_id|
            #crear HasCategory HasCategor<article_id: 1, category_id:2
                HasCategory.find_or_create_by(article: self,category_id: category_id)
        end      
    end
end