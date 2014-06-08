class AddUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :forget_password_question
      t.string :question_answer
      t.string :token
      t.boolean :is_admin,:default=>false
      t.timestamps
end
end

end
