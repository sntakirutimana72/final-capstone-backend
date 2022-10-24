# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

 respond_to :json

 private

 def respond_with(resource, options={})
   if resource.persisted?
      render json: {
        status: {code: 200, message: "Sign up successful", data: resource}, status: :ok
      } else
       render json: {
        message: "Person couldn't be created", error: resource.errors.full_messages
       }, status: unprocessable_entity
   end
 end

end
