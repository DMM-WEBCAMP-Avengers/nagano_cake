class Genre < ApplicationRecord

	has_many :products

	validates :name, presence: true

	#boolean型はpresence: trueにしてしまうと、falseを空だと認識して弾かれてしまうので以下のように記述。
	validates :validation, inclusion:{in: [true, false]}

end
