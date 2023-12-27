class AddReceiverEmailToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :receiver_email, :string
  end
end
