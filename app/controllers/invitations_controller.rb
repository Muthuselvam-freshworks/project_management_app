class InvitationsController < ApplicationController
    before_action :authenticate_user! 
    


    def index
        @invitations = current_user.received_invitations.where.not(sender_id: current_user.id)
      end
    def set_project
        @project = Project.find(params[:project_id])
      end 
      def new
        @project = Project.find(params[:project_id])
        @invitation = Invitation.new
      end
      def create
        @project = Project.find(params[:project_id])
        @invitation = Invitation.new(invitation_params)
        @invitation.sender = current_user
        @invitation.project = @project
      
        if @invitation.save
          redirect_to project_path(@project), notice: 'Invitation sent successfully.'
        else
          puts @invitation.errors.full_messages.inspect
          render 'projects/show'
        end
      end
      def accept
        @invitation = Invitation.find(params[:id])
        process_invitation_acceptance
      end
    
      def process_invitation_acceptance
        if @invitation.update(status: 'accepted')
          # Associate the receiver with the project
          @invitation.receiver.joined_projects << @invitation.project
    
          redirect_to dashboard_path, notice: 'Invitation accepted.'
        else
          # Handle errors
          redirect_to dashboard_path, alert: 'Error accepting invitation.'
        end
      end
     

      def reject
        @invitation = Invitation.find(params[:id])
        @invitation.update(status: 'rejected')
        
        redirect_to dashboard_path, notice: 'Invitation rejected.'
      end

      private

      def invitation_params
        params.require(:invitation).permit(:receiver_email)
      end
end
