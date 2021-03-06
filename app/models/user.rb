class User < ApplicationRecord
    #メールを小文字にして保存⬇︎
    before_save { self.email.downcase! }
     #パスワードを二重チェックし、暗号化
    has_secure_password         

    validates :name, presence: true, length: { maximum: 50 }    #名前は50文字以下を許可
    validates :email, presence: true, length: { maximum: 255 },  #emailは255文字以下を許可
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }                  #email重複を許可せず、大文字と小文字の区別はつけない



    mount_uploader :image, ImageUploader #画像アップロード機能の搭載                  

    has_many :reads    #書籍登録の読んだ本用


    has_many :readings  #書籍登録の読んでいる本用

    has_many :willreads  #書籍登録の読みたい本用

    has_many :relationships      #フォローしているユーザーのモデル参照
    has_many :followings, through: :relationships, source: :follow
    has_many :reverses_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'  #フォローされているユーザーのモデル参照

    has_many :followers, through: :reverses_of_relationships, source: :user


    def follow(other_user)
        unless self == other_user
            self.relationships.find_or_create_by(follow_id: other_user.id)
        end
    end

    def unfollow(other_user)
        relationship = self.relationships.find_by(follow_id: other_user.id)
        relationship.destroy if relationship
    end

    def following?(other_user)
        self.followings.include?(other_user)
    end
end
