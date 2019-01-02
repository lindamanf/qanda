class Question < ApplicationRecord
    # has_many 複数持つ
    # dependent questionが削除されたら対象のanswerが全て削除される
    has_many :answers, dependent: :destroy

    # 必須項目に設定
    validates :name, presence: true
    validates :title, presence: true
    validates :content, presence: true    
end
