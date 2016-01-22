class Zombie < ActiveRecord::Base
	scope :rotting, -> { where(rotting: true)}
	scope :young, ->{ where("age < 18")}
	scope :recent, ->{ order("created_at desc").limit(3)}

	#call back function不要寫在update method 裡面，因為這樣只有call 這個metho才會更新
	#有可能在其他地方也在改zombie ，這樣就不會更新到
	before_save :make_rotting

	def make_rotting
		self.rotting = true if age > 20 
	end

	# 此外有before的call back 不能回傳false，這樣物件永遠不能存/更新/刪除成功
	# before_save :X
	# def X
	# 	false
	# end

	#  更多例子
	#  after_create :send_welcome_email 使用者創帳號傳email給他們
  #  before_save :encrypt_password 加密
  #  before_destroy :set_deleted_flag 使用者刪除帳號但不想真的從資料庫刪除，把他的flag欄位設成false然後return false 就不會真的刪除

  has_one :brain, dependent: :destroy  #要加這個當Zombie刪掉時候，brain才會一起刪
  # console: a = Zombie.first a.create_brain status:"..."
  # 不能a.brain.create
  # relationship其他option（看文件）
	# dependent: :destroy will call destroy on associated objects
	# foreign_key: :undead_id changes the associated key (i.e. zombie_id)
	# primary_key: :zid changes the primary key (i.e. id)
	# validate: true  when zombie validates brain will too

	#多對多
	has_many :assignments
	has_many :roles, through: :assignments
	#console :
	#a.roles << Role.find_by_title(:BOSS) 
	#a.roles 

	#一對多
	has_many :tweets, dependent: :destroy
	#console :
	#a = Zombie.first
	#a.tweets.create status:'good' 比 Tweet.create status:'good',zombie:a 好更直觀

	# after_save :decomp_change_notification, if: :decomp_changed? 執行有錯待問
	#decomp_changed是activerecord預設的helper，會偵測attribute有沒有變


	# @zombie.to_json(include: :brain, except: [:created_at, :updated_at, :id])
	# 想要每次用到to_json都用以上限定的寫法，
	# 這樣如果用to_json沒有指定條件，就用這個default條件
	def as_json(options = nil)
		super(options ||
					{include: :brain, except: [:created_at, :updated_at, :id]})
 	end

	private
	def decomp_change_notification 
			ZombieMailer.decomp_change(self).deliver
			#self就是傳zombie物件
	end


end
