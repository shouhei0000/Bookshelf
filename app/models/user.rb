class User < ApplicationRecord
    #メールを小文字にして保存⬇︎
    before_save { self.email.downcase! }
     #パスワードを二重チェックし、暗号化
    has_secure_password         

    validates :name, presence: true, length: { maximum: 50 }    #名前は50文字以下を許可
    validates :email, presence: true, length: { maximum: 255 },  #emailは255文字以下を許可
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }                  #email重複を許可せず、大文字と小文字の区別はつけない



    #mount_uploader :image, ImageUploader #画像アップロード機能の搭載                  

end
